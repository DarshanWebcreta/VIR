import 'package:vir/features/auth/domain/entities/user_data.dart';


class LoginResponse {
  final String accessToken;
  final String tokenType;
  final String status;
  final String message;
  final UserData? data;

  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.status,
    required this.message,
    required this.data,
  });


}