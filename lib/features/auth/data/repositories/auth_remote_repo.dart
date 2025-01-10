
import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/auth/data/model/login_model.dart';


abstract interface class AuthRemoteRepo{
  Future<LoginModel> loginApi({required String data});
  Future<CommonModel> forgetPasswordApi({required String data});

}

class AuthImplRemoteRepo implements AuthRemoteRepo{
  final ApiService apiService;


  AuthImplRemoteRepo({required this.apiService});

  @override
  Future<LoginModel> loginApi({required String data}) {
    return apiService.login(data);
  }

  @override
  Future<CommonModel> forgetPasswordApi({required String data}) {
    return apiService.forgetPassword(data);

  }

}