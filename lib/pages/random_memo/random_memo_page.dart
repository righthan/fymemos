import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fymemos/data/services/api/api_client.dart';
import 'package:fymemos/data/services/shared_preference_service.dart';
import 'package:fymemos/model/memos.dart';
import 'package:fymemos/utils/page_token.dart';
import 'package:fymemos/widgets/memo.dart';
import 'package:fymemos/model/users.dart';
import 'package:fymemos/utils/result.dart';
import 'package:fymemos/utils/load_state.dart';

enum BrowseMode { random, lastYear, tag }

class RandomMemoPage extends StatefulWidget {
  const RandomMemoPage({super.key});
  @override
  State<RandomMemoPage> createState() => _RandomMemoPageState();
}

class _RandomMemoPageState extends State<RandomMemoPage> {
  final PageController _pageController = PageController();
  final List<Memo> _memos = [];
  final List<int> _usedOffsets = [];
  
  int _total = 0;
  bool _loading = false;
  bool _hasMore = true;
  bool _initialLoaded = false;
  
  BrowseMode _currentMode = BrowseMode.random;
  Map<String, int> _tagCount = {};
  String? _selectedTag;
  String? _nextPageToken;

  @override
  void initState() {
    super.initState();
    _initTotalAndLoad();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    if (_pageController.hasClients) {
      final idx = _pageController.page?.round() ?? 0;
      if (_hasMore && idx >= _memos.length - 2 && !_loading) {
        _loadMore();
      }
    }
  }

  Future<void> _initTotalAndLoad() async {
    setState(() => _loading = true);
    // 获取用户信息和统计
    final userResult = await ApiClient.instance.getAuthStatus();
    if (userResult is Ok<UserProfile>) {
      final statsResult = await ApiClient.instance.getUserStats(userResult.value.name);
      if (statsResult is Ok<UserStats>) {
        _total = statsResult.value.memoTimes.length;
        _tagCount = statsResult.value.tagCount;
        await _loadMore();
      }
    }
    if (!_initialLoaded) {
      setState(() => _loading = false);
    }
  }

  void _resetAndLoad() {
    _memos.clear();
    _usedOffsets.clear();
    _initialLoaded = false;
    _hasMore = true;
    _nextPageToken = null;
    _loadMore();
  }

  String? _buildFilter() {
    switch (_currentMode) {
      case BrowseMode.lastYear:
        final now = DateTime.now();
        final lastYear = DateTime(now.year - 1, now.month, now.day);
        final startTime = lastYear.toUtc().toIso8601String();
        final endTime = DateTime(lastYear.year, lastYear.month, lastYear.day + 1).toUtc().toIso8601String();
        return 'create_time >= "$startTime" && create_time < "$endTime"';
      case BrowseMode.tag:
        return _selectedTag != null ? 'content.contains("#$_selectedTag")' : null;
      case BrowseMode.random:
      default:
        return null;
    }
  }

  Future<void> _loadMore() async {
    if (_total == 0) return;
    if (!_initialLoaded) {
      setState(() => _loading = true);
    }
    
    final userResult = await SharedPreferencesService.instance.fetchUserDirect();
    final user = userResult;
    final filter = _buildFilter();
    
    if (_currentMode == BrowseMode.lastYear) {
      // 去年今日模式使用分页token或首次请求
      final res = await ApiClient.instance.fetchUserMemos(
        user: user,
        pageToken: _nextPageToken,
        filter: filter,
      );
      if (res is Success<MemosResponse>) {
        final value = res.value;
        if (value.memos?.isNotEmpty == true) {
          _memos.addAll(value.memos!);
          _nextPageToken = value.nextPageToken;
          if (_nextPageToken?.isEmpty == true || _nextPageToken == null) {
            _hasMore = false;
          }
          
          if (!_initialLoaded) {
            setState(() {
              _loading = false;
              _initialLoaded = true;
            });
          }
        } else {
          _hasMore = false;
        }
      }
    } else {
      // 随机模式或按标签随机模式
      final random = Random();
      int count = 0;
      final targetTotal = _currentMode == BrowseMode.tag && _selectedTag != null 
          ? _tagCount[_selectedTag!] ?? 0 
          : _total;
      
      while (count < 5 && _usedOffsets.length < targetTotal) {
        int offset = random.nextInt(targetTotal);
        if (_usedOffsets.contains(offset)) continue;
        _usedOffsets.add(offset);
        final token = PageTokenCrypto.createPageToken(1, offset);
        final res = await ApiClient.instance.fetchUserMemos(
          user: user,
          pageToken: token,
          filter: filter,
        );
        if (res is Success<MemosResponse>) {
          final value = res.value;
          if (value.memos?.isNotEmpty == true) {
            _memos.add(value.memos!.first);
            count++;
            

            
            // 加载到第一条后立即停止显示loading
            if (!_initialLoaded) {
              setState(() {
                _loading = false;
                _initialLoaded = true;
              });
            }
          }
        }
      }
      if (_usedOffsets.length >= targetTotal) _hasMore = false;
    }
    
    if (_initialLoaded) {
      setState(() {});
    }
  }

  void _showTagSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('选择标签', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _tagCount.entries.map((entry) => ListTile(
                  title: Text('#${entry.key}'),
                  subtitle: Text('${entry.value} 条笔记'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedTag = entry.key;
                      _currentMode = BrowseMode.tag;
                    });
                    _resetAndLoad();
                  },
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentMode == BrowseMode.lastYear 
            ? '去年今日' 
            : _currentMode == BrowseMode.tag 
                ? '标签: #$_selectedTag' 
                : '随机笔记浏览'),
        actions: [
          PopupMenuButton<BrowseMode>(
            onSelected: (mode) {
              if (mode == BrowseMode.tag) {
                _showTagSelector();
              } else {
                setState(() {
                  _currentMode = mode;
                  _selectedTag = null;
                });
                _resetAndLoad();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: BrowseMode.random,
                child: ListTile(
                  leading: Icon(Icons.shuffle),
                  title: Text('随机浏览'),
                ),
              ),
              PopupMenuItem(
                value: BrowseMode.lastYear,
                child: ListTile(
                  leading: Icon(Icons.history),
                  title: Text('去年今日'),
                ),
              ),
              PopupMenuItem(
                value: BrowseMode.tag,
                child: ListTile(
                  leading: Icon(Icons.tag),
                  title: Text('按标签浏览'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: _loading && _memos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: _pageController,
              itemCount: _memos.length,
              itemBuilder: (context, index) {
                final cardHeight = MediaQuery.of(context).size.height - 
                                  AppBar().preferredSize.height - 
                                  MediaQuery.of(context).padding.top;
                return SizedBox(
                  height: cardHeight,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 50),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: MemoItem(
                        key: ValueKey(_memos[index].name),
                        memo: _memos[index],
                        isDetail: true,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
} 