import 'product.dart';

class Datum {
  num? id;
  Product? product;

  Datum({this.id, this.product});

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: num.tryParse(json['id'].toString()),
      product:
          json['product'] == null
              ? null
              : Product.fromJson(Map<String, dynamic>.from(json['product'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (product != null) 'product': product?.toJson(),
    };
  }
}
