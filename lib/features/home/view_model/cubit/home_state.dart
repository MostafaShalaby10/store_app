part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingGetHomeDataProductsState extends HomeState {}

final class SuccessfullyGetHomeDataProductsState extends HomeState {
  final bool status;
  SuccessfullyGetHomeDataProductsState(this.status);
}

final class ErrorGetHomeDataProductsState extends HomeState {
  final String error;
  ErrorGetHomeDataProductsState(this.error);
}

final class LoadingAddOrRemoveFavoriteState extends HomeState {}

final class SuccessfullyAddOrRemoveFavoriteState extends HomeState {
  final bool status;
  final String message;
  SuccessfullyAddOrRemoveFavoriteState(this.status, this.message);
}

final class ErrorAddOrRemoveFavoriteState extends HomeState {
  final String error;
  ErrorAddOrRemoveFavoriteState(this.error);
}

final class LoadingAddOrRemoveCartState extends HomeState {}

final class SuccessfullyAddOrRemoveCartState extends HomeState {
  final bool status;
  final String message;
  SuccessfullyAddOrRemoveCartState(this.status, this.message);
}

final class ErrorAddOrRemoveCartState extends HomeState {
  final String error;
  ErrorAddOrRemoveCartState(this.error);
}
