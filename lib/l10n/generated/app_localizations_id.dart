// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get helloWorld => 'Halo gan !!';

  @override
  String get fetchingInformation => 'Mendapatkan informasi ...';

  @override
  String get typeMessage => 'Ketik pesan ...';

  @override
  String get sendButton => 'kirim';

  @override
  String get today => 'Hari Ini';

  @override
  String get yesterday => 'Kemarin';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galeri';

  @override
  String textBadgeDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String get uploadImageFailed =>
      'Upload gambar gagal, klik di sini untuk mengirim ulang';

  @override
  String get sendMessageFailed =>
      'Pesan gagal dikirim, klik di sini untuk mengirim ulang';

  @override
  String get scanningImage => 'Mengenali gambar ...';

  @override
  String get textSelect => 'Pilih';

  @override
  String get textPossibilitiesFound =>
      'Hi, Vita menemukan beberapa penjelasan dari gambar yang kamu kirim, tolong bantu Vita memilih manakah yang paling sesuai dengan gambar yang kamu kirim, dan Vita akan memberikan penjelasan lebih lanjut';

  @override
  String get textLogin => 'Masuk';

  @override
  String get textSignUp => 'Daftar';

  @override
  String get textEmail => 'E-mail';

  @override
  String get textPassword => 'Kata Sandi';

  @override
  String get textRepeatPassword => 'Ulangi Kata Sandi';

  @override
  String get textFirstName => 'Nama Depan';

  @override
  String get textLastName => 'Nama Belakang';

  @override
  String get textNickname => 'Nama Panggilan';

  @override
  String get textBirthday => 'Tanggal Ulang Tahun';

  @override
  String get textAgreeTo => 'Saya telah membaca dan menyetujui ';

  @override
  String get textUserAgreement => 'persetujuan pengguna ';

  @override
  String get textAnd => 'dan ';

  @override
  String get textPrivacyPolicy => 'kebijakan privasi';

  @override
  String get textOr => 'atau';

  @override
  String get textEmptyEmail => 'E-mail belum diisi.';

  @override
  String get textEmptyPassword => 'Password belum diisi.';

  @override
  String get textEmptyFirstName => 'Nama depan belum diisi.';

  @override
  String get textEmptyLastName => 'Nama belakang belum diisi.';

  @override
  String get textEmptyNickname => 'Nama panggilan belum diisi.';

  @override
  String get textEmptyBirthday => 'Tanggal ulang tahun belum diisi.';

  @override
  String get textPasswordMinimum => 'Password harus lebih dari 8 karakter';

  @override
  String get textPasswordMustContain =>
      'Password harus mengandung setidaknya satu huruf besar, \n angka, dan karakter spesial.';

  @override
  String get textEmptyRepeatPassword => 'Ulangi password anda.';

  @override
  String get textIncorrectRepeatPassword => 'Password tidak sesuai.';

  @override
  String get textLoading => 'Loading ...';

  @override
  String get textLogout => 'Keluar';

  @override
  String get textLogoutConfirmation =>
      'Apakah anda yakin akan keluar dari akun ini ?';

  @override
  String get textYes => 'Ya';

  @override
  String get textNo => 'Tidak';

  @override
  String get textConfirmation => 'Konfirmasi';
}
