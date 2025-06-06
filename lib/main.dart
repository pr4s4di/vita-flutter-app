import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vita_client_app/core/di.dart';
import 'package:vita_client_app/l10n/generated/app_localizations.dart';
import 'package:vita_client_app/util/constant/font.dart';
import 'package:vita_client_app/util/constant/routes.dart';
import 'package:vita_client_app/view/chat/bloc/chat_bloc.dart';
import 'package:vita_client_app/view/chat/chat_screen.dart';
import 'package:vita_client_app/view/chat_image/chat_image_screen.dart';
import 'package:vita_client_app/view/login/bloc/login_bloc.dart';
import 'package:vita_client_app/view/login/login_screen.dart';
import 'package:vita_client_app/view/profile/bloc/profile_bloc.dart';
import 'package:vita_client_app/view/profile/profile_screen.dart';
import 'package:vita_client_app/view/register/bloc/register_bloc.dart';
import 'package:vita_client_app/view/register/register_screen.dart';
import 'package:vita_client_app/view/splash/bloc/splash_bloc.dart';
import 'package:vita_client_app/view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc(di.get(), di.get())),
        BlocProvider(
            create: (_) => ChatBloc(di.get(), di.get(), di.get(), di.get())),
        BlocProvider(create: (_) => LoginBloc(di.get(), di.get())),
        BlocProvider(create: (_) => RegisterBloc(di.get())),
        BlocProvider(create: (_) => ProfileBloc(di.get(), di.get()))
      ],
      child: MaterialApp(
        title: 'Vita',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          Routes.splash: (_) => const SplashScreen(),
          Routes.chat: (_) => ChatScreen(),
          Routes.login: (_) => const LoginScreen(),
          Routes.register: (_) => const RegisterScreen(),
          Routes.profile: (_) => const ProfileScreen(),
          Routes.chatImage: (_) => const ChatImageScreen(),
        },
        initialRoute: Routes.splash,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: poppins,
            textTheme: const TextTheme(
              titleSmall: TextStyle(fontFamily: poppins, fontSize: 12),
              titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              bodySmall: TextStyle(fontSize: 12),
              bodyMedium: TextStyle(fontSize: 14),
              bodyLarge: TextStyle(fontSize: 18),
              labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
