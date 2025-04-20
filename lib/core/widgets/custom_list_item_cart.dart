import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_widget.dart';

class CustomListItemCart extends StatelessWidget {
  const CustomListItemCart({
    super.key,
    required this.image,
    required this.productName,
    required this.productPrice,
  });

  final String image;
  final String productName;
  final num productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 215, 209, 209),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          CachedNetworkImage(width: 70.w, imageUrl: image),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: productName,
                  fontSize: 20,
                  maxLines: 1,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextWidget(
                  text: productPrice.toString(),
                  fontSize: 17,
                  textColor: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
