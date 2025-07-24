// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title_memo => 'Memo';

  @override
  String get title_settings => 'Settings';

  @override
  String get title_archived => 'Archived';

  @override
  String get title_resources => 'Resources';

  @override
  String get title_about => 'About';

  @override
  String memo_days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Days',
      one: 'Day',
      zero: 'Day',
    );
    return '$_temp0';
  }

  @override
  String memo_tags(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tags',
      one: 'Tag',
      zero: 'Tag',
    );
    return '$_temp0';
  }

  @override
  String memo_memos(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Memos',
      one: 'Memo',
      zero: 'Memo',
    );
    return '$_temp0';
  }

  @override
  String get edit_rename => 'Rename';

  @override
  String get edit_delete => 'Delete';

  @override
  String get edit_archive => 'Archive';

  @override
  String get edit_pin => 'Pin';

  @override
  String get edit_restore => 'Restore';

  @override
  String get edit_Unpin => 'Unpin';

  @override
  String get edit_edit => 'Edit';

  @override
  String get share => 'Share';

  @override
  String get title_login => 'Login';

  @override
  String get button_save => 'Save';

  @override
  String get button_cancel => 'Cancel';

  @override
  String get button_login => 'Login';

  @override
  String get button_logout => 'Logout';

  @override
  String get title_theme => 'Theme Mode';

  @override
  String get theme_system => 'System';

  @override
  String get theme_light => 'Light';

  @override
  String get theme_dark => 'Dark';

  @override
  String get title_home => 'Home';

  @override
  String get hint_search => 'Search Memos...';

  @override
  String get delete_memo_confirm =>
      'Are you sure you want to delete this memo? THIS ACTION IS IRREVERSIBLE';

  @override
  String get title_delete_tag => 'Delete Tag';

  @override
  String delete_tag_confirm(String tag) {
    return 'Are you sure you want to delete this tag? This will remove all memos related to #$tag.';
  }

  @override
  String get visibility_public => 'Public';

  @override
  String get visibility_private => 'Private';

  @override
  String get visibility_workspace => 'Workspace';

  @override
  String memo_reference_one(String snippet) {
    return 'Referencing 1 memo: $snippet';
  }

  @override
  String memo_reference_by_one(String snippet) {
    return 'Referenced by 1 memo: $snippet';
  }

  @override
  String memo_references(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Referencing with $count memos',
      one: 'Referencing with 1 memo',
      zero: 'Referencing with 0 memo',
    );
    return '$_temp0';
  }

  @override
  String get memo_title_detail => 'Memo Detail';

  @override
  String get title_rename_tag => 'Rename Tag';

  @override
  String get button_finish => 'Finish';

  @override
  String get hint_new_tag => 'New tag name';

  @override
  String get msg_tag_rename => 'Tag renamed';

  @override
  String get msg_tag_delete => 'Tag deleted';

  @override
  String get time_now => 'Now';

  @override
  String time_minutes_ago(num minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes ago',
      one: '1 minute ago',
      zero: 'Now',
    );
    return '$_temp0';
  }

  @override
  String time_hours_ago(num hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours ago',
      one: '1 hour ago',
      zero: 'Now',
    );
    return '$_temp0';
  }

  @override
  String time_days_ago(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days ago',
      one: 'Yesterday',
      zero: 'Now',
    );
    return '$_temp0';
  }

  @override
  String get login_type_access_token => 'Login with Access Token';

  @override
  String get login_type_password => 'Login with Password';

  @override
  String get login_hint_access_token => 'Access Token';

  @override
  String get login_hint_password => 'Password';

  @override
  String get login_hint_username => 'Username';

  @override
  String get login_hint_host => 'Server Address';

  @override
  String get login_tips =>
      'Please enter your Memos Host and Account Information';

  @override
  String get privacy_policy => 'Privacy Policy';

  @override
  String get title_explore => 'Explore';

  @override
  String get content_hint => 'Any thoughts...';

  @override
  String get empty_tips => 'Nothing here, start writing now!';

  @override
  String get title_color_mode => 'Theme Color';
}
