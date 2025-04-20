part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class LoadingGetCartItems extends CartState {}

class SuccessGetCartItems extends CartState {
  final dynamic message;
  final bool status;
  SuccessGetCartItems(this.message, this.status);
}

final class ErrorGetCartItems extends CartState {
  final String error;
  ErrorGetCartItems(this.error);
}
