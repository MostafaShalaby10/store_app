import 'product.dart';

class CartItem {
  num? id;
  num? quantity;
  Product? product;

  CartItem({this.id, this.quantity, this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: num.tryParse(json['id'].toString()),
      quantity: num.tryParse(json['quantity'].toString()),
      product:
          json['product'] == null
              ? null
              : Product.fromJson(Map<String, dynamic>.from(json['product'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (quantity != null) 'quantity': quantity,
      if (product != null) 'product': product?.toJson(),
    };
  }
}
