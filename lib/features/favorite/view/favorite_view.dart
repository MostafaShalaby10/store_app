import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utilis/service_locator.dart';
import 'package:shop_app/core/widgets/custom_list_item_cart.dart';
import 'package:shop_app/core/widgets/custom_text_widget.dart';
import 'package:shop_app/features/favorite/model/repos/favorite_repo_imp.dart';
import 'package:shop_app/features/favorite/view_model/cubit/favorite_cubit.dart';
import 'package:shop_app/features/products/view/specific_product_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FavoriteCubit(getIt<FavoriteRepoImp>())..getFavorites(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          FavoriteCubit favoriteCubit = FavoriteCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const CustomTextWidget(
                text: "Favorite",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            body:
                state is! LoadingGetFavorites
                    ? ListView.builder(
                      itemCount:
                          favoriteCubit
                              .favoriteResponseModel
                              .data!
                              .data!
                              .length,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => SpecificProductView(
                                          productId:
                                              favoriteCubit
                                                  .favoriteResponseModel
                                                  .data!
                                                  .data![index]
                                                  .product!
                                                  .id!
                                                  .toInt(),
                                        ),
                                  ),
                                );
                              },
                              child: CustomListItemCart(
                                image:
                                    favoriteCubit
                                        .favoriteResponseModel
                                        .data!
                                        .data![index]
                                        .product!
                                        .image!,
                                productName:
                                    favoriteCubit
                                        .favoriteResponseModel
                                        .data!
                                        .data![index]
                                        .product!
                                        .name!,
                                productPrice:
                                    favoriteCubit
                                        .favoriteResponseModel
                                        .data!
                                        .data![index]
                                        .product!
                                        .price!,
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
