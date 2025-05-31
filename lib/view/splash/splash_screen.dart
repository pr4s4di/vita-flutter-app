import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vita_client_app/l10n/generated/app_localizations.dart';
import 'package:vita_client_app/util/constant/routes.dart';
import 'package:vita_client_app/view/splash/bloc/splash_bloc.dart';
import 'package:vita_client_app/view/splash/bloc/splash_state.dart';
import 'package:vita_client_app/view/widgets/image_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<SplashBloc>().add(const CheckLoginEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashCheckLoginState) {
          if (state.isLoggedIn) {
            context.read<SplashBloc>().add(const GetMessageEvent());
          } else {
            Navigator.pushReplacementNamed(context, Routes.login);
          }
        } else if (state is SplashLoadedState || state is SplashErrorState) {
          Navigator.pushReplacementNamed(context, Routes.chat);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ImageLogo(),
                  if (state is SplashLoadingState)
                    const CircularProgressIndicator(),
                  if (state is SplashLoadingState)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.fetchingInformation,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
