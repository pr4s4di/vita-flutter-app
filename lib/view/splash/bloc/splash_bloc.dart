import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vita_client_app/domain/check_login.dart';
import 'package:vita_client_app/domain/fetch_message.dart';
import 'package:vita_client_app/view/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckLogin _checkLogin;
  final FetchMessage _fetchMessage;

  SplashBloc(this._checkLogin, this._fetchMessage)
      : super(const SplashInitialState()) {
    on<SplashEvent>((event, emit) async {
      await event.when(
        onGetMessage: () async {
          emit(const SplashState.loading());
          await _fetchMessage().then((value) {
            emit(const SplashState.loadedState());
          }).catchError((error) {
            emit(SplashState.error(error.toString()));
          });
        },
        onCheckLogin: () async {
          try {
            emit(const SplashState.loading());
            final isLoggedIn = _checkLogin.call();
            emit(SplashState.checkLoginState(isLoggedIn));
          } catch (e) {
            emit(const SplashState.checkLoginState(false));
          }
        },
      );
    });
  }
}
