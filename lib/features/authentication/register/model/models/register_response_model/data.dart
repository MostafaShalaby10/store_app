class Data {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;

  Data({this.name, this.email, this.phone, this.id, this.image, this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'id': id,
      'image': image,
      'token': token,
    };
  }
}
