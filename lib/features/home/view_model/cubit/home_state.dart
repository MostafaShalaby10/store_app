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
