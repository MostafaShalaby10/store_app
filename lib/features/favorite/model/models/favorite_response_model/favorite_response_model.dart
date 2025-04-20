import 'data.dart';

class FavoriteResponseModel {
  bool? status;
  dynamic message;
  Data? data;

  FavoriteResponseModel({this.status, this.message, this.data});

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteResponseModel(
      status: json['status']?.toString().contains("true"),
      message: json['message'],
      data:
          json['data'] == null
              ? null
              : Data.fromJson(Map<String, dynamic>.from(json['data'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (status != null) 'status': status,
      if (message != null) 'message': message,
      if (data != null) 'data': data?.toJson(),
    };
  }
}
