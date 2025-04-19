import 'data.dart';

class HomeResponseModel {
  bool? status;
  dynamic message;
  Data? data;

  HomeResponseModel({this.status, this.message, this.data});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
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
