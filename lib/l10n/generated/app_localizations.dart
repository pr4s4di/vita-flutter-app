import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
    Locale('id')
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// Text fetching information for splash page
  ///
  /// In en, this message translates to:
  /// **'Fetching Information ...'**
  String get fetchingInformation;

  /// Text type message for type message text field
  ///
  /// In en, this message translates to:
  /// **'Type Message ...'**
  String get typeMessage;

  /// Text for button send
  ///
  /// In en, this message translates to:
  /// **'send'**
  String get sendButton;

  /// Text today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Text yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// Text camera
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Text gallery
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// Text badge with date
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String textBadgeDate(DateTime date);

  /// Error message for upload image failed
  ///
  /// In en, this message translates to:
  /// **'Upload image failed, click here to retry'**
  String get uploadImageFailed;

  /// Error message for send message failed
  ///
  /// In en, this message translates to:
  /// **'Failed to send message, click to retry'**
  String get sendMessageFailed;

  /// Text for scanning image
  ///
  /// In en, this message translates to:
  /// **'Scanning image ...'**
  String get scanningImage;

  /// Text for button select
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get textSelect;

  /// Text for button select
  ///
  /// In en, this message translates to:
  /// **'Hi, Vita read and recognise these things in your picture, please help me to choose which one is correct, and Vita\'ll describe it'**
  String get textPossibilitiesFound;

  /// No description provided for @textLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get textLogin;

  /// No description provided for @textSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get textSignUp;

  /// No description provided for @textEmail.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get textEmail;

  /// No description provided for @textPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get textPassword;

  /// No description provided for @textRepeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get textRepeatPassword;

  /// No description provided for @textFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get textFirstName;

  /// No description provided for @textLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get textLastName;

  /// No description provided for @textNickname.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get textNickname;

  /// No description provided for @textBirthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get textBirthday;

  /// No description provided for @textAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to Vita’s '**
  String get textAgreeTo;

  /// No description provided for @textUserAgreement.
  ///
  /// In en, this message translates to:
  /// **'user agreement '**
  String get textUserAgreement;

  /// No description provided for @textAnd.
  ///
  /// In en, this message translates to:
  /// **'and '**
  String get textAnd;

  /// No description provided for @textPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get textPrivacyPolicy;

  /// No description provided for @textOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get textOr;

  /// No description provided for @textEmptyEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email.'**
  String get textEmptyEmail;

  /// No description provided for @textEmptyPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid password.'**
  String get textEmptyPassword;

  /// No description provided for @textEmptyFirstName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name.'**
  String get textEmptyFirstName;

  /// No description provided for @textEmptyLastName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name.'**
  String get textEmptyLastName;

  /// No description provided for @textEmptyNickname.
  ///
  /// In en, this message translates to:
  /// **'Please enter your nickname.'**
  String get textEmptyNickname;

  /// No description provided for @textEmptyBirthday.
  ///
  /// In en, this message translates to:
  /// **'Please enter your birthday.'**
  String get textEmptyBirthday;

  /// No description provided for @textPasswordMinimum.
  ///
  /// In en, this message translates to:
  /// **'Please enter at least 8 characters'**
  String get textPasswordMinimum;

  /// No description provided for @textPasswordMustContain.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase, \nlowercase, number, and a special character.'**
  String get textPasswordMustContain;

  /// No description provided for @textEmptyRepeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Please repeat your password.'**
  String get textEmptyRepeatPassword;

  /// No description provided for @textIncorrectRepeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Password does not match.'**
  String get textIncorrectRepeatPassword;

  /// No description provided for @textLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading ...'**
  String get textLoading;

  /// No description provided for @textLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get textLogout;

  /// No description provided for @textLogoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout from this account ?'**
  String get textLogoutConfirmation;

  /// No description provided for @textYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get textYes;

  /// No description provided for @textNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get textNo;

  /// No description provided for @textConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get textConfirmation;
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
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
