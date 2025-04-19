class Data {
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;
  List<dynamic>? images;

  Data({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorites,
    this.inCart,
    this.images,
  });

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) {
    return Data(
      id: num.tryParse(json['id'].toString()),
      price: num.tryParse(json['price'].toString()),
      oldPrice: num.tryParse(json['old_price'].toString()),
      discount: num.tryParse(json['discount'].toString()),
      image: json['image']?.toString(),
      name: json['name']?.toString(),
      description: json['description']?.toString(),
      inFavorites: json['in_favorites']?.toString().contains("true"),
      inCart: json['in_cart']?.toString().contains("true"),
      images: List<dynamic>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (oldPrice != null) 'old_price': oldPrice,
      if (discount != null) 'discount': discount,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (inFavorites != null) 'in_favorites': inFavorites,
      if (inCart != null) 'in_cart': inCart,
      if (images != null) 'images': images,
    };
  }
}
