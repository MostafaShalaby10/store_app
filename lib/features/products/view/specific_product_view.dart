import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/widgets/custom_text_widget.dart';

import '../../../core/utilis/service_locator.dart';
import '../model/repos/specifc_produc_repo_imp.dart';
import '../view_model/cubit/specific_product_cubit.dart';

class SpecificProductView extends StatelessWidget {
  final int productId;
  const SpecificProductView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              SpecificProductCubit(getIt<SpecifcProducRepoImp>())
                ..getSpecificProduct(productId: productId),
      child: BlocConsumer<SpecificProductCubit, SpecificProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SpecificProductCubit specificProductCubit = SpecificProductCubit.get(
            context,
          );
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child:
                  state is! LoadingGetSpecifcDataState
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CachedNetworkImage(
                                  width: double.infinity,
                                  height: 250.h,
                                  imageUrl:
                                      specificProductCubit
                                          .specificProductModel
                                          .data!
                                          .image!,
                                  errorWidget:
                                      (context, url, error) =>
                                          const Icon(Icons.error),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  spacing: 10.w,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        color:
                                            specificProductCubit
                                                    .specificProductModel
                                                    .data!
                                                    .inFavorites!
                                                ? Colors.red
                                                : Colors.grey,
                                        Icons.favorite,
                                        size: 30,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        color:
                                            specificProductCubit
                                                    .specificProductModel
                                                    .data!
                                                    .inCart!
                                                ? Colors.red
                                                : Colors.grey,
                                        Icons.shopping_cart,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              spacing: 20.w,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: CustomTextWidget(
                                    text:
                                        specificProductCubit
                                            .specificProductModel
                                            .data!
                                            .name!,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                CustomTextWidget(
                                  text:
                                      "${specificProductCubit.specificProductModel.data!.price}\$",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                            // CustomTextWidget(
                            //   text:
                            //       specificProductCubit
                            //           .specificProductModel
                            //           .data!
                            //           .description!,
                            //   textAlign: TextAlign.start,
                            //   maxLines: 10,
                            //   fontSize: 17,
                            //   fontWeight: FontWeight.w300,
                            // ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text.rich(
                                softWrap: true,
                                textDirection: TextDirection.rtl,
                                TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  text:
                                      specificProductCubit
                                          .specificProductModel
                                          .data!
                                          .description!,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    specificProductCubit
                                        .specificProductModel
                                        .data!
                                        .images!
                                        .length,
                                itemBuilder:
                                    (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            specificProductCubit
                                                .specificProductModel
                                                .data!
                                                .images![index],
                                        errorWidget:
                                            (context, url, error) =>
                                                const Icon(Icons.error),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )
                      : const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
