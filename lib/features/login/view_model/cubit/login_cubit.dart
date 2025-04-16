import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/utilis/shared_prefrences.dart';
import 'package:shop_app/features/login/model/models/login_response_model/login_response_model.dart';
import 'package:shop_app/features/login/model/repos/login_repo_interface.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepoInterface) : super(LoginInitial());

  final LoginRepoInterface _loginRepoInterface;

  late LoginResponseModel loginResponseModel;
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
          loginResponseModel = LoginResponseModel.fromJson(value.data);
          // To save user token
          if (loginResponseModel.status!) {
            SharedPrefs.saveData(
              key: "token",
              value: loginResponseModel.data!.token!,
            );
          }
          emit(
            SuccessfullyLoginFunction(
              //To check if valid login or not
              message: loginResponseModel.message!,
              status: loginResponseModel.status!,
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorLoginFunction(error.toString()));
        });
  }
}
