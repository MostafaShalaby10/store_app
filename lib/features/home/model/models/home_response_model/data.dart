import 'banner.dart';
import 'product.dart';

class Data {
  List<Banners>? banners;
  List<Product>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      banners:
          (json['banners'] as List<dynamic>?)
              ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
              .toList(),
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
      ad: json['ad'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banners': banners?.map((e) => e.toJson()).toList(),
      'products': products?.map((e) => e.toJson()).toList(),
      'ad': ad,
    };
  }
}
