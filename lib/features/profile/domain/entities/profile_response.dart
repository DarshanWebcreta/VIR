import 'package:vir/features/profile/domain/entities/profile_data.dart';

class ProfileResponse {
  final String status;
  final String message;
  final ProfileData data;

  ProfileResponse({
    required this.status,
    required this.message,
    required this.data,
  });


}


