import 'data.dart';

class RegisterResponseModel {
  bool? status;
  String? message;
  Data? data;

  RegisterResponseModel({this.status, this.message, this.data});

  factory RegisterResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegisterResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      'status': status,
      'message': message,
      'data':
          data?.toJson(),
    };
  }
}
