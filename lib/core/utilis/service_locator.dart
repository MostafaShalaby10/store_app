import 'package:get_it/get_it.dart';
import 'package:shop_app/core/dio_helper/api_service.dart';
import 'package:shop_app/features/login/model/repos/login_repo_imp.dart';
import 'package:shop_app/features/register/model/repos/register_repo_imp.dart';

final getIt = GetIt.instance;
void setup() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => LoginRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => RegisterRepoImp(getIt<ApiService>()));
}
