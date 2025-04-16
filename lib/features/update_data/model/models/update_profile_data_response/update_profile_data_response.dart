import 'data.dart';

class UpdateProfileDataResponse {
  bool? status;
  String? message;
  Data? data;

  UpdateProfileDataResponse({this.status, this.message, this.data});

  factory UpdateProfileDataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateProfileDataResponse(
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
