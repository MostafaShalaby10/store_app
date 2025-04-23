part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class LoadingGetFavorites extends FavoriteState {}

class SuccessGetFavorites extends FavoriteState {
  final dynamic message;
  final bool status;
  SuccessGetFavorites(this.message, this.status);
}

final class ErrorGetFavorites extends FavoriteState {
  final String error;
  ErrorGetFavorites(this.error);
}
