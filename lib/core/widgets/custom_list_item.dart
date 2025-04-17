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
  });

  final String productName;
  final String productImage;
  final double productPrice;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * .35,
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
                  fit: BoxFit.cover,
                  // height: MediaQuery.of(context).size.height * .5,
                  imageUrl: productImage,
                  placeholder:
                      (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.green[300]),
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
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart_outlined),
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
