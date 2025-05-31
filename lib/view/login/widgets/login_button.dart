import 'package:flutter/material.dart';
import 'package:vita_client_app/l10n/generated/app_localizations.dart';
import 'package:vita_client_app/util/constant/font.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(45),
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(12),
      ),
      child: Text(
        AppLocalizations.of(context)!.textLogin,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: poppins,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
