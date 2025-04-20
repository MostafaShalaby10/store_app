import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/model/repos/cart_repo_interface.dart';
import 'package:shop_app/features/home/model/models/home_response_model/product.dart';
import 'package:shop_app/features/home/model/repos/home_repo_interface.dart';

import '../../../favorite/model/repos/favorite_repo_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoInterface _homeRepoInterface;
  final FavoriteRepoInterface _favoriteRepoInterface;
  final CartRepoInterface _cartRepoInterface;
  HomeCubit(
    this._homeRepoInterface,
    this._favoriteRepoInterface,
    this._cartRepoInterface,
  ) : super(HomeInitial());

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

  Future addOrRemoveFavorite(int productId) async {
    emit(LoadingAddOrRemoveFavoriteState());
    _favoriteRepoInterface
        .addOrRemoveFavorite(productId)
        .then((value) {
          emit(
            SuccessfullyAddOrRemoveFavoriteState(
              value.data["status"],
              value.data["message"],
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorAddOrRemoveFavoriteState(error.toString()));
        });
  }

  Future addOrRemoveCart(int productId) async {
    emit(LoadingAddOrRemoveCartState());
    _cartRepoInterface
        .addOrRemoveCart(productId)
        .then((value) {
          emit(
            SuccessfullyAddOrRemoveCartState(
              value.data["status"],
              value.data["message"],
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorAddOrRemoveCartState(error.toString()));
        });
  }
}
