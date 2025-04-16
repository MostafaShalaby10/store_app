import 'package:dio/dio.dart';
import 'package:shop_app/core/dio_helper/api_service.dart';
import 'package:shop_app/core/utilis/shared_prefrences.dart';
import 'package:shop_app/features/profile/model/repos/profile_repo_interface.dart';

class ProfileRepoImp implements ProfileRepoInterface {
  final ApiService _apiService;
  ProfileRepoImp(this._apiService);
  @override
  Future<Response> getProfileData() {
    return _apiService.getResponse(
      endPoint: "profile",
      token: SharedPrefs.getData(key: "token"),
    );
  }
}
