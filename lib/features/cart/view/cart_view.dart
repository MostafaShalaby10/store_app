import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utilis/service_locator.dart';
import 'package:shop_app/core/widgets/custom_list_item_cart.dart';
import 'package:shop_app/core/widgets/custom_text_widget.dart';
import 'package:shop_app/features/cart/model/repos/cart_repo_imp.dart';
import 'package:shop_app/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:shop_app/features/products/view/specific_product_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt<CartRepoImp>())..getCartItems(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          CartCubit cartCubit = CartCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const CustomTextWidget(
                text: "Cart",
                fontSize: 25,

                fontWeight: FontWeight.w500,
              ),
            ),
            body:
                state is! LoadingGetCartItems
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount:
                            cartCubit.cartResponseMode.data!.cartItems!.length,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (c) => SpecificProductView(
                                            productId:
                                                cartCubit
                                                    .cartResponseMode
                                                    .data!
                                                    .cartItems![index]
                                                    .product!
                                                    .id!
                                                    .toInt(),
                                          ),
                                    ),
                                  );
                                },
                                child: CustomListItemCart(
                                  image:
                                      cartCubit
                                          .cartResponseMode
                                          .data!
                                          .cartItems![index]
                                          .product!
                                          .image!,
                                  productName:
                                      cartCubit
                                          .cartResponseMode
                                          .data!
                                          .cartItems![index]
                                          .product!
                                          .name!,
                                  productPrice:
                                      cartCubit
                                          .cartResponseMode
                                          .data!
                                          .cartItems![index]
                                          .product!
                                          .price!,
                                ),
                              ),
                            ),
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
