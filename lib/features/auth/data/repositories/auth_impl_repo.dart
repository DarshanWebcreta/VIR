
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/auth/data/model/login_model.dart';
import 'package:vir/features/auth/data/repositories/auth_remote_repo.dart';
import 'package:vir/features/auth/domain/repository/auth_repository.dart';


class AuthImplRepo implements AuthRepository{
  final AuthRemoteRepo loginRemoteRepo;

  AuthImplRepo({required this.loginRemoteRepo});

  @override
  Future<Either<Failure, LoginModel>> loginApi({required String data}) async{
    try {
      final respo = await loginRemoteRepo.loginApi(data: data);
      return right(respo);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> forgetPasswordApi({required String data}) async{
    try {
      final respo = await loginRemoteRepo.forgetPasswordApi(data: data);
      return right(respo);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

}