import 'package:dio/dio.dart';
import '../../../../core/dio_helper/api_service.dart';
import '../../../../core/utilis/shared_prefrences.dart';
import 'home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  final ApiService _apiService;
  HomeRepoImp(this._apiService);

  @override
  Future<Response> getHomeData() async {
    return await _apiService.getResponse(
      endPoint: "home",
      token: SharedPrefs.getData(key: "token"),
    );
  }
}
