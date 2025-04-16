import 'package:dio/dio.dart';
import 'package:shop_app/core/dio_helper/api_service.dart';
import 'package:shop_app/core/utilis/shared_prefrences.dart';
import 'package:shop_app/features/update_data/model/models/profile_update_model.dart';

import 'update_data_repo_interface.dart';

class UpdateDataRepoImp implements UpdateDataRepoInterface {
  final ApiService _apiService;
  UpdateDataRepoImp(this._apiService);
  @override
  Future<Response> updateDataFunction({
    required String name,
    required String email,
    required String phone,
  }) {
    ProfileUpdateModel profileUpdateModel = ProfileUpdateModel(
      name: name,
      email: email,
      phone: phone,
    );
    return _apiService.putResponse(
      endPoint: "update-profile",
      query: profileUpdateModel.profileDatatoJson(),
      token: SharedPrefs.getData(key: "token"),
    );
  }
}
