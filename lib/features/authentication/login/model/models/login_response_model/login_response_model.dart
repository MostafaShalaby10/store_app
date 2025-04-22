import 'data.dart';

class LoginResponseModel {
  bool? status;
  String? message;
  Data? data;

  LoginResponseModel({this.status, this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }
}
