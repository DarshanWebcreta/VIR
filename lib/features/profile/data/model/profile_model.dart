import 'package:vir/features/profile/domain/entities/profile_data.dart';
import 'package:vir/features/profile/domain/entities/profile_response.dart';

class ProfileModel extends ProfileResponse{
  ProfileModel({required super.status, required super.message, required super.data});
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'],
      message: json['message'],
      data: ProfileData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}