import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/auth/domain/repository/auth_repository.dart';

class ForgetPasswordUsecase implements UseCase<CommonModel, ForgetPasswordParams> {
  final AuthRepository authRepository;

  ForgetPasswordUsecase({required this.authRepository});

  @override
  Future<Either<Failure, CommonModel>> call(ForgetPasswordParams params) {
    return authRepository.forgetPasswordApi(data: params.data);
  }
}

class ForgetPasswordParams {
  final String data;

  ForgetPasswordParams({required this.data});
}
