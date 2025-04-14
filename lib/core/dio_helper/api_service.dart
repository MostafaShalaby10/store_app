import 'package:dio/dio.dart';
import 'package:shop_app/core/dio_helper/api_constants.dart';

class ApiService {
  Dio _dio = Dio();
  Future<Response> postResponse({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    var response = _dio.post(baseUrl + endPoint, data: query);
    return response;
  }

  Future<Response> getResponse({
    required String endPoint,
    String? token,
  }) async {
    var response = _dio.get(
      baseUrl + endPoint,
      options: Options(headers: {"Authorization": token}),
    );
    return response;
  }

  Future<Response> putResponse({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    var response = _dio.put(baseUrl + endPoint, data: query);
    return response;
  }
}
