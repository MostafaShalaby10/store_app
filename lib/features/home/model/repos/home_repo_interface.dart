import 'package:dio/dio.dart';

abstract class HomeRepoInterface {
  Future<Response> getHomeData();
}
