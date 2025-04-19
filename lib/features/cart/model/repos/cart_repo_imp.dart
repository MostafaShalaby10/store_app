import 'package:dio/dio.dart';

import '../../../../core/dio_helper/api_service.dart';
import '../../../../core/utilis/shared_prefrences.dart';
import 'cart_repo_interface.dart';

class CartRepoImp implements CartRepoInterface {
  final ApiService _apiService;

  CartRepoImp(this._apiService);

  @override
  Future<Response> addOrRemoveCart(int productId) async {
    return await _apiService.postResponse(
      endPoint: "carts",
      query: {"product_id": productId},
      token: SharedPrefs.getData(key: "token"),
    );
  }

  @override
  Future<Response> getCart() async {
    return await _apiService.getResponse(endPoint: "carts" , token: SharedPrefs.getData(key: "token"));
  }

 
}
