import 'package:get_it/get_it.dart';
import '../../features/cart/model/repos/cart_repo_imp.dart';
import '../../features/favorite/model/repos/favorite_repo_imp.dart';
import '../../features/home/model/repos/home_repo_imp.dart';
import '../../features/authentication/login/model/repos/login_repo_imp.dart';
import '../../features/products/model/repos/specifc_produc_repo_imp.dart';
import '../../features/profile/model/repos/profile_repo_imp.dart';
import '../../features/authentication/register/model/repos/register_repo_imp.dart';
import '../../features/update_data/model/repos/update_data_repo_imp.dart';
import '../dio_helper/api_service.dart';

final getIt = GetIt.instance;
void setup() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => LoginRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => RegisterRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => ProfileRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => UpdateDataRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => HomeRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => SpecifcProducRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => FavoriteRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => CartRepoImp(getIt<ApiService>()));
}
