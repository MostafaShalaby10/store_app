import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_widget.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.discount,
    this.onFavoriteTap,
    this.onCartTap,
    required this.favIconColor,
    required this.cartIconColor,
  });

  final String productName;
  final String productImage;
  final double productPrice;
  final int discount;
  final Function()? onFavoriteTap;
  final Function()? onCartTap;
  final Color favIconColor;
  final Color cartIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * .5,
                  imageUrl: productImage,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.teal[100]),
                  child: CustomTextWidget(
                    text: "Discount $discount%",
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: productName,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextWidget(
                        text: productPrice.toString(),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    IconButton(
                      onPressed: onFavoriteTap,
                      icon: Icon(Icons.favorite, color: favIconColor),
                    ),
                    IconButton(
                      onPressed: onCartTap,
                      icon: Icon(Icons.add_shopping_cart, color: cartIconColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
