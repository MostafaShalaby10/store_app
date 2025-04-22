import 'package:dio/dio.dart';
import 'package:shop_app/core/dio_helper/api_service.dart';
import 'package:shop_app/features/authentication/login/model/repos/login_repo_interface.dart';

class LoginRepoImp implements LoginRepoInterface {
  final ApiService _apiService;
  LoginRepoImp(this._apiService);
  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await _apiService.postResponse(
      endPoint: "login",
      query: {"email": email, "password": password},
    );
  }
}
