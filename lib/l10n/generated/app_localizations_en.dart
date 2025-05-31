// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get fetchingInformation => 'Fetching Information ...';

  @override
  String get typeMessage => 'Type Message ...';

  @override
  String get sendButton => 'send';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String textBadgeDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String get uploadImageFailed => 'Upload image failed, click here to retry';

  @override
  String get sendMessageFailed => 'Failed to send message, click to retry';

  @override
  String get scanningImage => 'Scanning image ...';

  @override
  String get textSelect => 'Select';

  @override
  String get textPossibilitiesFound =>
      'Hi, Vita read and recognise these things in your picture, please help me to choose which one is correct, and Vita\'ll describe it';

  @override
  String get textLogin => 'Login';

  @override
  String get textSignUp => 'Sign Up';

  @override
  String get textEmail => 'E-mail';

  @override
  String get textPassword => 'Password';

  @override
  String get textRepeatPassword => 'Repeat Password';

  @override
  String get textFirstName => 'First Name';

  @override
  String get textLastName => 'Last Name';

  @override
  String get textNickname => 'Nickname';

  @override
  String get textBirthday => 'Birthday';

  @override
  String get textAgreeTo => 'I have read and agree to Vita’s ';

  @override
  String get textUserAgreement => 'user agreement ';

  @override
  String get textAnd => 'and ';

  @override
  String get textPrivacyPolicy => 'privacy policy';

  @override
  String get textOr => 'or';

  @override
  String get textEmptyEmail => 'Please enter a valid email.';

  @override
  String get textEmptyPassword => 'Please enter a valid password.';

  @override
  String get textEmptyFirstName => 'Please enter your first name.';

  @override
  String get textEmptyLastName => 'Please enter your last name.';

  @override
  String get textEmptyNickname => 'Please enter your nickname.';

  @override
  String get textEmptyBirthday => 'Please enter your birthday.';

  @override
  String get textPasswordMinimum => 'Please enter at least 8 characters';

  @override
  String get textPasswordMustContain =>
      'Password must contain at least one uppercase, \nlowercase, number, and a special character.';

  @override
  String get textEmptyRepeatPassword => 'Please repeat your password.';

  @override
  String get textIncorrectRepeatPassword => 'Password does not match.';

  @override
  String get textLoading => 'Loading ...';

  @override
  String get textLogout => 'Logout';

  @override
  String get textLogoutConfirmation =>
      'Are you sure you want to logout from this account ?';

  @override
  String get textYes => 'Yes';

  @override
  String get textNo => 'No';

  @override
  String get textConfirmation => 'Confirmation';
}
