// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get title_memo => '笔记';

  @override
  String get title_settings => '设置';

  @override
  String get title_archived => '归档';

  @override
  String get title_resources => '资源';

  @override
  String get title_about => '关于';

  @override
  String memo_days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '天',
      one: '天',
      zero: '天',
    );
    return '$_temp0';
  }

  @override
  String memo_tags(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '标签',
      one: '标签',
      zero: '标签',
    );
    return '$_temp0';
  }

  @override
  String memo_memos(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '笔记',
      one: '笔记',
      zero: '笔记',
    );
    return '$_temp0';
  }

  @override
  String get edit_rename => '重命名';

  @override
  String get edit_delete => '删除';

  @override
  String get edit_archive => '归档';

  @override
  String get edit_pin => '置顶';

  @override
  String get edit_restore => '恢复';

  @override
  String get edit_Unpin => '取消置顶';

  @override
  String get edit_edit => '编辑';

  @override
  String get share => '分享';

  @override
  String get title_login => '登录';

  @override
  String get button_save => '保存';

  @override
  String get button_cancel => '取消';

  @override
  String get button_login => '登录';

  @override
  String get button_logout => '登出';

  @override
  String get title_theme => '主题';

  @override
  String get theme_system => '跟随系统';

  @override
  String get theme_light => '亮色';

  @override
  String get theme_dark => '暗色';

  @override
  String get title_home => '首页';

  @override
  String get hint_search => '搜索笔记...';

  @override
  String get delete_memo_confirm => '你确定要删除这篇笔记吗? ⚠️此操作不可撤销';

  @override
  String get title_delete_tag => '删除标签';

  @override
  String delete_tag_confirm(String tag) {
    return '确定要删除这个标签吗? 这同时会删除所有关联到 #$tag的笔记。';
  }

  @override
  String get visibility_public => '公开';

  @override
  String get visibility_private => '仅自己可见';

  @override
  String get visibility_workspace => '工作空间可见';

  @override
  String memo_reference_one(String snippet) {
    return '引用一条笔记: $snippet';
  }

  @override
  String memo_reference_by_one(String snippet) {
    return '被一条笔记引用: $snippet';
  }

  @override
  String memo_references(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '与$count条笔记关联',
      one: '与一条笔记关联',
      zero: '没有与任何笔记关联',
    );
    return '$_temp0';
  }

  @override
  String get memo_title_detail => '笔记详情';

  @override
  String get title_rename_tag => '标签改名';

  @override
  String get button_finish => '完成';

  @override
  String get hint_new_tag => '新标签名';

  @override
  String get msg_tag_rename => '标签改成成功';

  @override
  String get msg_tag_delete => '标签已删除';

  @override
  String get time_now => '刚刚';

  @override
  String time_minutes_ago(num minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes分钟前',
      one: '1分钟前',
      zero: '刚刚',
    );
    return '$_temp0';
  }

  @override
  String time_hours_ago(num hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours小时',
      one: '1小时前',
      zero: '刚刚',
    );
    return '$_temp0';
  }

  @override
  String time_days_ago(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days天前',
      one: '昨天',
      zero: '刚刚',
    );
    return '$_temp0';
  }

  @override
  String get login_type_access_token => '使用Access Token登录';

  @override
  String get login_type_password => '使用用户名和密码登录';

  @override
  String get login_hint_access_token => 'Access Token';

  @override
  String get login_hint_password => '密码';

  @override
  String get login_hint_username => '用户名';

  @override
  String get login_hint_host => '服务器地址';

  @override
  String get login_tips => '请输入你的Memos服务器地址和账户信息登录';

  @override
  String get privacy_policy => '隐私政策';

  @override
  String get title_explore => '探索';

  @override
  String get content_hint => '此刻的想法...';

  @override
  String get empty_tips => '此处空空，去记录你的想法吧！';

  @override
  String get title_color_mode => '主题色';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn() : super('zh_CN');

  @override
  String get title_memo => '笔记';

  @override
  String get title_settings => '设置';

  @override
  String get title_archived => '归档';

  @override
  String get title_resources => '资源';

  @override
  String get title_about => '关于';

  @override
  String memo_days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '天',
      one: '天',
      zero: '天',
    );
    return '$_temp0';
  }

  @override
  String memo_tags(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '标签',
      one: '标签',
      zero: '标签',
    );
    return '$_temp0';
  }

  @override
  String memo_memos(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '笔记',
      one: '笔记',
      zero: '笔记',
    );
    return '$_temp0';
  }

  @override
  String get edit_rename => '重命名';

  @override
  String get edit_delete => '删除';

  @override
  String get edit_archive => '归档';

  @override
  String get edit_pin => '置顶';

  @override
  String get edit_restore => '恢复';

  @override
  String get edit_Unpin => '取消置顶';

  @override
  String get edit_edit => '编辑';

  @override
  String get share => '分享';

  @override
  String get title_login => '登录';

  @override
  String get button_save => '保存';

  @override
  String get button_cancel => '取消';

  @override
  String get button_login => '登录';

  @override
  String get button_logout => '登出';

  @override
  String get title_theme => '主题';

  @override
  String get theme_system => '跟随系统';

  @override
  String get theme_light => '亮色';

  @override
  String get theme_dark => '暗色';

  @override
  String get title_home => '首页';

  @override
  String get hint_search => '搜索笔记...';

  @override
  String get delete_memo_confirm => '你确定要删除这篇笔记吗? ⚠️此操作不可撤销';

  @override
  String get title_delete_tag => '删除标签';

  @override
  String delete_tag_confirm(String tag) {
    return '确定要删除这个标签吗? 这同时会删除所有关联到 #$tag的笔记。';
  }

  @override
  String get visibility_public => '公开';

  @override
  String get visibility_private => '仅自己可见';

  @override
  String get visibility_workspace => '工作空间可见';

  @override
  String memo_reference_one(String snippet) {
    return '引用一条笔记: $snippet';
  }

  @override
  String memo_reference_by_one(String snippet) {
    return '被一条笔记引用: $snippet';
  }

  @override
  String memo_references(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '与$count条笔记关联',
      one: '与一条笔记关联',
      zero: '没有与任何笔记关联',
    );
    return '$_temp0';
  }

  @override
  String get memo_title_detail => '笔记详情';

  @override
  String get title_rename_tag => '标签改名';

  @override
  String get button_finish => '完成';

  @override
  String get hint_new_tag => '新标签名';

  @override
  String get msg_tag_rename => '标签改成成功';

  @override
  String get msg_tag_delete => '标签已删除';

  @override
  String get time_now => '刚刚';

  @override
  String time_minutes_ago(num minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes分钟前',
      one: '1分钟前',
      zero: '刚刚',
    );
    return '$_temp0';
  }

  @override
  String time_hours_ago(num hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours小时',
      one: '1小时前',
      zero: '刚刚',
    );
    return '$_temp0';
  }

  @override
  String time_days_ago(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days天前',
      one: '昨天',
      zero: '刚刚',
    );
    return '$_temp0';
  }

  @override
  String get login_type_access_token => '使用Access Token登录';

  @override
  String get login_type_password => '使用用户名和密码登录';

  @override
  String get login_hint_access_token => 'Access Token';

  @override
  String get login_hint_password => '密码';

  @override
  String get login_hint_username => '用户名';

  @override
  String get login_hint_host => '服务器地址';

  @override
  String get login_tips => '请输入你的Memos服务器地址和账户信息登录';

  @override
  String get privacy_policy => '隐私政策';

  @override
  String get title_explore => '探索';

  @override
  String get content_hint => '此刻的想法...';

  @override
  String get empty_tips => '此处空空，去记录你的想法吧！';

  @override
  String get title_color_mode => '主题色';
}
