import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/favorite/model/models/favorite_response_model/favorite_response_model.dart';
import 'package:shop_app/features/favorite/model/repos/favorite_repo_interface.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepoInterface _favoriteRepoInterface;
  FavoriteCubit(this._favoriteRepoInterface) : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);

 late FavoriteResponseModel favoriteResponseModel ; 

 Future getFavorites() async {
    emit(LoadingGetFavorites());
    await _favoriteRepoInterface
        .getFavorites()
        .then((value) {
          favoriteResponseModel = FavoriteResponseModel.fromJson(value.data);
          emit(
            SuccessGetFavorites(
              favoriteResponseModel.message,
              favoriteResponseModel.status!,
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetFavorites(error.toString()));
        });
  }
}
