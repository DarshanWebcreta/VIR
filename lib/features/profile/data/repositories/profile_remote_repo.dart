import 'dart:convert';

import 'package:vir/data/api_service.dart';
import 'package:vir/features/profile/data/model/profile_model.dart';
import 'package:vir/core/common/common_model.dart';

abstract interface class ProfileRemoteRepo {
  Future<ProfileModel> fetchProfile();
  Future<CommonModel> updateProfile({required dynamic data});
  Future<CommonModel> changePassword({required dynamic data});
}

class ProfileImplRemoteRepo implements ProfileRemoteRepo {
  final ApiService apiService;

  ProfileImplRemoteRepo({required this.apiService});

  @override
  Future<ProfileModel> fetchProfile() {
    return apiService.profile();
  }

  @override
  Future<CommonModel> updateProfile({required dynamic data}) {
    return apiService.updateProfile(jsonEncode(data));
  }

  @override
  Future<CommonModel> changePassword({required dynamic data}) {
    return apiService.changePass(jsonEncode(data));
  }
}
