class Banners {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  Banners({this.id, this.image, this.category, this.product});

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      id: json['id'] as int?,
      image: json['image'] as String?,
      category: json['category'] as dynamic,
      product: json['product'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'image': image, 'category': category, 'product': product};
  }
}
