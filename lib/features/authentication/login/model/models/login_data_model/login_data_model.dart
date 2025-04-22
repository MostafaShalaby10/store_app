class LoginDataModel {
  String? email;
  String? password;

  LoginDataModel({this.email, this.password});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
