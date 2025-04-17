import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/home/model/models/home_response_model/product.dart';
import 'package:shop_app/features/home/model/repos/home_repo_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoInterface _homeRepoInterface;
  HomeCubit(this._homeRepoInterface) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<dynamic> products = [];
  List<dynamic> banners = [];
  Future getHomeDataProducts() async {
    emit(LoadingGetHomeDataProductsState());
    _homeRepoInterface
        .getHomeData()
        .then((value) {
          for (var element in value.data['data']['banners']) {
            banners.add(element);
          }
          for (var element in value.data['data']['products']) {
            products.add(Product.fromJson(element));
          }
          emit(SuccessfullyGetHomeDataProductsState(value.data["status"]));
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetHomeDataProductsState(error.toString()));
        });
  }
}
