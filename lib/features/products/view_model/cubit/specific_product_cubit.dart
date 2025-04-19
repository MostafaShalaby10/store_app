import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/products/model/models/specific_product_model/specific_product_model.dart';
import 'package:shop_app/features/products/model/repos/specific_product_repo_interface.dart';

part 'specific_product_state.dart';

class SpecificProductCubit extends Cubit<SpecificProductState> {
  final SpecificProductRepoInterface _specificProductRepoInterface;
  SpecificProductCubit(this._specificProductRepoInterface)
    : super(SpecificProductInitial());
  static SpecificProductCubit get(context) => BlocProvider.of(context);

  late SpecificProductModel specificProductModel;
  Future getSpecificProduct({required int productId}) async {
    emit(LoadingGetSpecifcDataState());
    _specificProductRepoInterface
        .getSpecificProduct(productId)
        .then((value) {
          specificProductModel = SpecificProductModel.fromJson(value.data);
          emit(
            SuccessfullyGetSpecifcDataState(
              status: specificProductModel.status!,
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetSpecifcDataState(error: error.toString()));
        });
  }
}
