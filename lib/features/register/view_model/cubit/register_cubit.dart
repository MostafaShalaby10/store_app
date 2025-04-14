import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/register/model/models/register_response_model/register_response_model.dart';
import 'package:shop_app/features/register/model/repos/register_repo_interface.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepoInterface _registerRepoInterface;
  RegisterCubit(this._registerRepoInterface) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  bool isConfirmPassword = true;
  void changePasswordVisiability() {
    isPassword = !isPassword;
    emit(RegisterChangePasswordVisiability());
  }

  void changeConfirmPasswordVisiability() {
    isConfirmPassword = !isConfirmPassword;
    emit(RegisterChangePasswordVisiability());
  }

  void disposeController(TextEditingController controller) {
    controller.dispose();
    log("Disposed Successfully ✅");
  }

  Future registerFunction({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(LoadingRegisterState());
    await _registerRepoInterface
        .register(name: name, email: email, password: password, phone: phone)
        .then((value) {
          RegisterResponseModel _registerResponseModel = RegisterResponseModel.fromJson(
            value.data,
          );
          emit(SuccessfullyRegisterState(status :_registerResponseModel.status! , message: _registerResponseModel.message!));
        })
        .catchError((error) {
          emit(ErrorRegisterState(error.toString()));
        });
  }
}
