part of 'specific_product_cubit.dart';

@immutable
sealed class SpecificProductState {}

final class SpecificProductInitial extends SpecificProductState {}

final class LoadingGetSpecifcDataState extends SpecificProductState {}

final class SuccessfullyGetSpecifcDataState extends SpecificProductState {
  final bool status;

  SuccessfullyGetSpecifcDataState({required this.status});
}

final class ErrorGetSpecifcDataState extends SpecificProductState {
  final String error;
  ErrorGetSpecifcDataState({required this.error});
}
