class ProfileUpdateModel {
  late String name;
  late String phone;
  late String email;
  String? password;
  String? image;

  ProfileUpdateModel({
    required this.email,
    this.image,
    required this.name,
    this.password,
    required this.phone,
  });
  Map<String, dynamic> allDatatoJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    };
  }

  Map<String, dynamic> profileDatatoJson() {
    return {'name': name, 'phone': phone, 'email': email};
  }
}
