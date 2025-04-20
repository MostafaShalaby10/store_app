import 'cart_item.dart';

class Data {
  List<CartItem>? cartItems;
  num? subTotal;
  num? total;

  Data({this.cartItems, this.subTotal, this.total});

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) {
    return Data(
      cartItems:
          (json['cart_items'] as List<dynamic>?)
              ?.map(
                (e) =>
                    CartItem.fromJson(
                      Map<String, dynamic>.from(e),
                    ),
              )
              .toList(),
      subTotal: num.tryParse(json['sub_total'].toString()),
      total: num.tryParse(json['total'].toString()),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (cartItems != null)
        'cart_items':
            cartItems
                ?.map(
                  (e) =>
                      e.toJson(),
                )
                .toList(),
      if (subTotal != null) 'sub_total': subTotal,
      if (total != null) 'total': total,
    };
  }
}
