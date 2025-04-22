class RegisterDataModel {
  late String name;
  late String email;
  late String password;
  late String phone;

  RegisterDataModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  RegisterDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "password": password, "phone": phone};
  }
}
