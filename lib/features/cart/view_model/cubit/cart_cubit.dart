import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/cart/model/models/cart_response_model/cart_response_model.dart';
import 'package:shop_app/features/cart/model/repos/cart_repo_interface.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepoInterface _cartRepoInterface;
  CartCubit(this._cartRepoInterface) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  late CartResponseModel cartResponseMode;

  Future getCartItems() async {
    emit(LoadingGetCartItems());
    await _cartRepoInterface
        .getCart()
        .then((value) {
          cartResponseMode = CartResponseModel.fromJson(value.data);
          emit(
            SuccessGetCartItems(
              cartResponseMode.message,
              cartResponseMode.status!,
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetCartItems(error.toString()));
        });
  }
}
