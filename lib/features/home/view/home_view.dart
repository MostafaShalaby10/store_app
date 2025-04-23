import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utilis/service_locator.dart';
import 'package:shop_app/core/widgets/custom_list_item.dart';
import 'package:shop_app/core/widgets/custom_text_widget.dart';
import 'package:shop_app/features/cart/model/repos/cart_repo_imp.dart';
import 'package:shop_app/features/cart/view/cart_view.dart';
import 'package:shop_app/features/favorite/view/favorite_view.dart';
import 'package:shop_app/features/home/model/repos/home_repo_imp.dart';
import 'package:shop_app/features/products/view/specific_product_view.dart';
import 'package:shop_app/features/profile/view/profile_view.dart';

import '../../favorite/model/repos/favorite_repo_imp.dart';
import '../view_model/cubit/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// For Bottom Navigation Bar
class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> pages = [
    const MainPage(),
    const FavoriteView(),
    const CartView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}

// For Home view
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeCubit(
            getIt<HomeRepoImp>(),
            getIt<FavoriteRepoImp>(),
            getIt<CartRepoImp>(),
          )..getHomeDataProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is SuccessfullyAddOrRemoveFavoriteState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ErrorAddOrRemoveFavoriteState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is SuccessfullyAddOrRemoveCartState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ErrorAddOrRemoveCartState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,

              title: const CustomTextWidget(
                text: "Home Page",
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            body:
                state is! LoadingGetHomeDataProductsState
                    ? SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomSlider(images: homeCubit.banners),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: homeCubit.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            itemBuilder:
                                (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (c) => SpecificProductView(
                                              productId:
                                                  homeCubit.products[index].id,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomListItem(
                                      cartIconColor:
                                          homeCubit.products[index].inCart!
                                              ? Colors.red
                                              : Colors.grey,
                                      favIconColor:
                                          homeCubit.products[index].inFavorites!
                                              ? Colors.red
                                              : Colors.grey,
                                      onFavoriteTap: () {
                                        homeCubit.addOrRemoveFavorite(
                                          homeCubit.products[index].id,
                                        );
                                      },
                                      onCartTap: () {
                                        homeCubit.addOrRemoveCart(
                                          homeCubit.products[index].id,
                                        );
                                      },
                                      discount:
                                          homeCubit.products[index].discount!,
                                      productImage:
                                          homeCubit.products[index].image!,
                                      productName:
                                          homeCubit.products[index].name!,
                                      productPrice:
                                          homeCubit.products[index].price!,
                                    ),
                                  ),
                                ),
                          ),
                        ],
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  final List images;
  const CustomSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
      ),
      items:
          images.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl:
                          i["image"], // ✅ i here represents each item in banners list
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
