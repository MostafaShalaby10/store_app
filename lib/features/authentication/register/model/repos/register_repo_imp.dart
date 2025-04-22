import 'package:dio/dio.dart';
import 'package:shop_app/core/dio_helper/api_service.dart';
import 'package:shop_app/features/authentication/register/model/repos/register_repo_interface.dart';

class RegisterRepoImp implements RegisterRepoInterface {
  final ApiService _apiService;
  RegisterRepoImp(this._apiService);
  @override
  Future<Response> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    var response = await _apiService.postResponse(
      endPoint: "register",
      query: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    );
    return response;
  }
}
