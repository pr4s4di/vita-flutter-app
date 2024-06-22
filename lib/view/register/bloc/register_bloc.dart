import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vita_client_app/data/model/response/response_error.dart';
import 'package:vita_client_app/domain/post_register.dart';
import 'package:vita_client_app/view/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final PostRegister _postRegister;

  RegisterBloc(this._postRegister) : super(const RegisterState.initial()) {
    on<PostRegisterEvent>((event, emit) async {
      emit(const RegisterState.loading());

      await _postRegister(event.request).then((value) {
        emit(const RegisterState.success());
      }).catchError((error) {
        if (error is ResponseError) {
          emit(RegisterState.error(error.message));
        } else {
          emit(RegisterState.error(error.toString()));
        }
      });
    });
  }
}
