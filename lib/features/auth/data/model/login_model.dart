

import 'package:vir/features/auth/domain/entities/login_data.dart';
import 'package:vir/features/auth/domain/entities/user_data.dart';

class LoginModel extends LoginResponse{

  LoginModel({required super.accessToken,required super.data,required
  super.message,required super.status,required super.tokenType});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      status: json['status'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}