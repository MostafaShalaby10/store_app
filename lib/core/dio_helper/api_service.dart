import 'package:dio/dio.dart';
import 'package:shop_app/core/contsants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response> postResponse({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    var response = _dio.post(
      baseUrl + endPoint,
      data: query,
      options: Options(headers: {"Authorization": token}),
    );
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
    String? token,
  }) async {
    var response = _dio.put(
      baseUrl + endPoint,
      data: query,
      options: Options(headers: {"Authorization": token}),
    );
    return response;
  }
}
