import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vita_client_app/data/model/response/response_error.dart';
import 'package:vita_client_app/domain/fetch_message.dart';
import 'package:vita_client_app/domain/post_login.dart';
import 'package:vita_client_app/view/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLogin _postLogin;
  final FetchMessage _fetchMessage;

  LoginBloc(this._postLogin, this._fetchMessage)
      : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        onLogin: (request) async {
          emit(const LoginState.loading());
          await _postLogin(request).then((value) {
            emit(const LoginState.success());
          }).catchError((error, stackTrace) {
            if (error is ResponseError) {
              emit(LoginState.error(error.message));
            } else {
              emit(LoginState.error(error.toString()));
            }
          });
        },
        onFetchMessage: () async {
          emit(const LoginState.fetchMessageLoading());
          await _fetchMessage().then((value) {
            emit(const LoginState.fetchMessageSuccess());
          }).catchError((error, stackTrace) {
            if (error is ResponseError) {
              emit(LoginState.error(error.message));
            } else {
              emit(LoginState.error(error.toString()));
            }
          });
        },
      );
    });
  }
}
