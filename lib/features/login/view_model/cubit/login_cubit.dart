import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/login/model/models/login_response_model/login_response_model.dart';
import 'package:shop_app/features/login/model/repos/login_repo_interface.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepoInterface) : super(LoginInitial());

  final LoginRepoInterface _loginRepoInterface;
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  void changePasswordVisiability() {
    isPassword = !isPassword;
    emit(LoginChangePasswordVisibilityState());
  }

  Future loginFunction({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginFunction());
    await _loginRepoInterface
        .login(email: email, password: password)
        .then((value) {
         LoginResponseModel _loginResponseModel =  LoginResponseModel.fromJson(value.data);
          emit(SuccessfullyLoginFunction(message: _loginResponseModel.message!, status: _loginResponseModel.status!));
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorLoginFunction(error.toString()));
        });
  }
}
