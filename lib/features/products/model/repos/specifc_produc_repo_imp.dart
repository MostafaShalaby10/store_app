import 'package:dio/dio.dart';
import 'package:shop_app/core/dio_helper/api_service.dart';
import 'package:shop_app/core/utilis/shared_prefrences.dart';

import 'specific_product_repo_interface.dart';

class SpecifcProducRepoImp implements SpecificProductRepoInterface {
  final ApiService _apiService;
  SpecifcProducRepoImp(this._apiService);

  @override
  Future<Response> getSpecificProduct(int productId) async {
    return await _apiService.getResponse(
      endPoint: "products/$productId",
      token: SharedPrefs.getData(key: "token"),
    );
  }
}
