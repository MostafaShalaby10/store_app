import 'data.dart';

class UserDataModel {
  bool? status;
  String? message;
  Data? data;

  UserDataModel({this.status, this.message, this.data});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
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
