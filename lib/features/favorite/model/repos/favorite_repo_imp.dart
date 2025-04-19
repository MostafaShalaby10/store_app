import 'package:dio/dio.dart';
import 'package:shop_app/core/dio_helper/api_service.dart';
import 'package:shop_app/core/utilis/shared_prefrences.dart';
import 'package:shop_app/features/favorite/model/repos/favorite_repo_interface.dart';

class FavoriteRepoImp implements FavoriteRepoInterface {
  final ApiService _apiService;

  FavoriteRepoImp(this._apiService);

  @override
  Future<Response> addOrRemoveFavorite(int productId) async {
    return await _apiService.postResponse(
      endPoint: "favorites",
      query: {"product_id": productId},
      token: SharedPrefs.getData(key: "token"),
    );
  }

  @override
  Future<Response> getFavorites() async {
    return await _apiService.getResponse(
      endPoint: "favorites",
      token: SharedPrefs.getData(key: "token"),
    );
  }
}
