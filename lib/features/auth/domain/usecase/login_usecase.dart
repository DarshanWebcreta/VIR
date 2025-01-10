import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/auth/data/model/login_model.dart';
import 'package:vir/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase implements UseCase<LoginModel, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, LoginModel>> call(LoginParams params) {
    return authRepository.loginApi(data: params.data);
  }
}

class LoginParams {
  final String data;

  LoginParams({required this.data});
}
