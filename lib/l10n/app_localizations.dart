import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale('zh', 'CN'),
  ];

  /// No description provided for @title_memo.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get title_memo;

  /// No description provided for @title_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get title_settings;

  /// No description provided for @title_archived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get title_archived;

  /// No description provided for @title_resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get title_resources;

  /// No description provided for @title_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get title_about;

  /// No description provided for @memo_days.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Day} =1{Day} other{Days}}'**
  String memo_days(num count);

  /// No description provided for @memo_tags.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Tag} =1{Tag} other{Tags}}'**
  String memo_tags(num count);

  /// No description provided for @memo_memos.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Memo} =1{Memo} other{Memos}}'**
  String memo_memos(num count);

  /// No description provided for @edit_rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get edit_rename;

  /// No description provided for @edit_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get edit_delete;

  /// No description provided for @edit_archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get edit_archive;

  /// No description provided for @edit_pin.
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get edit_pin;

  /// No description provided for @edit_restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get edit_restore;

  /// No description provided for @edit_Unpin.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get edit_Unpin;

  /// No description provided for @edit_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit_edit;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @title_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get title_login;

  /// No description provided for @button_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get button_save;

  /// No description provided for @button_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get button_cancel;

  /// No description provided for @button_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get button_login;

  /// No description provided for @button_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get button_logout;

  /// No description provided for @title_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get title_theme;

  /// No description provided for @theme_system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get theme_system;

  /// No description provided for @theme_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get theme_light;

  /// No description provided for @theme_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get theme_dark;

  /// No description provided for @title_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get title_home;

  /// No description provided for @hint_search.
  ///
  /// In en, this message translates to:
  /// **'Search Memos...'**
  String get hint_search;

  /// No description provided for @delete_memo_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this memo? THIS ACTION IS IRREVERSIBLE'**
  String get delete_memo_confirm;

  /// No description provided for @title_delete_tag.
  ///
  /// In en, this message translates to:
  /// **'Delete Tag'**
  String get title_delete_tag;

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this tag? This will remove all memos related to #{tag}.'**
  String delete_tag_confirm(String tag);

  /// No description provided for @visibility_public.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get visibility_public;

  /// No description provided for @visibility_private.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get visibility_private;

  /// No description provided for @visibility_workspace.
  ///
  /// In en, this message translates to:
  /// **'Workspace'**
  String get visibility_workspace;

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'Referencing 1 memo: {snippet}'**
  String memo_reference_one(String snippet);

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'Referenced by 1 memo: {snippet}'**
  String memo_reference_by_one(String snippet);

  /// No description provided for @memo_references.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Referencing with 0 memo} =1{Referencing with 1 memo} other{Referencing with {count} memos}}'**
  String memo_references(num count);

  /// No description provided for @memo_title_detail.
  ///
  /// In en, this message translates to:
  /// **'Memo Detail'**
  String get memo_title_detail;

  /// No description provided for @title_rename_tag.
  ///
  /// In en, this message translates to:
  /// **'Rename Tag'**
  String get title_rename_tag;

  /// No description provided for @button_finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get button_finish;

  /// No description provided for @hint_new_tag.
  ///
  /// In en, this message translates to:
  /// **'New tag name'**
  String get hint_new_tag;

  /// No description provided for @msg_tag_rename.
  ///
  /// In en, this message translates to:
  /// **'Tag renamed'**
  String get msg_tag_rename;

  /// No description provided for @msg_tag_delete.
  ///
  /// In en, this message translates to:
  /// **'Tag deleted'**
  String get msg_tag_delete;

  /// No description provided for @time_now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get time_now;

  /// No description provided for @time_minutes_ago.
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, =0{Now} =1{1 minute ago} other{{minutes} minutes ago}}'**
  String time_minutes_ago(num minutes);

  /// No description provided for @time_hours_ago.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =0{Now} =1{1 hour ago} other{{hours} hours ago}}'**
  String time_hours_ago(num hours);

  /// No description provided for @time_days_ago.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =0{Now} =1{Yesterday} other{{days} days ago}}'**
  String time_days_ago(num days);

  /// No description provided for @login_type_access_token.
  ///
  /// In en, this message translates to:
  /// **'Login with Access Token'**
  String get login_type_access_token;

  /// No description provided for @login_type_password.
  ///
  /// In en, this message translates to:
  /// **'Login with Password'**
  String get login_type_password;

  /// No description provided for @login_hint_access_token.
  ///
  /// In en, this message translates to:
  /// **'Access Token'**
  String get login_hint_access_token;

  /// No description provided for @login_hint_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_hint_password;

  /// No description provided for @login_hint_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get login_hint_username;

  /// No description provided for @login_hint_host.
  ///
  /// In en, this message translates to:
  /// **'Server Address'**
  String get login_hint_host;

  /// No description provided for @login_tips.
  ///
  /// In en, this message translates to:
  /// **'Please enter your Memos Host and Account Information'**
  String get login_tips;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @title_explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get title_explore;

  /// No description provided for @content_hint.
  ///
  /// In en, this message translates to:
  /// **'Any thoughts...'**
  String get content_hint;

  /// No description provided for @empty_tips.
  ///
  /// In en, this message translates to:
  /// **'Nothing here, start writing now!'**
  String get empty_tips;

  /// No description provided for @title_color_mode.
  ///
  /// In en, this message translates to:
  /// **'Theme Color'**
  String get title_color_mode;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
