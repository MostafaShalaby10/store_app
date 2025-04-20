class Product {
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: num.tryParse(json['id'].toString()),
      price: num.tryParse(json['price'].toString()),
      oldPrice: num.tryParse(json['old_price'].toString()),
      discount: num.tryParse(json['discount'].toString()),
      image: json['image']?.toString(),
      name: json['name']?.toString(),
      description: json['description']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (oldPrice != null) 'old_price': oldPrice,
      if (discount != null) 'discount': discount,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    };
  }
}
