import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/profile/domain/repository/profile_repository.dart';

class ChangePasswordUseCase implements UseCase<CommonModel, ChangePasswordParams> {
  final ProfileRepo profileRepo;

  ChangePasswordUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, CommonModel>> call(ChangePasswordParams params) {
    return profileRepo.changePassword(data: params.data);
  }
}

class ChangePasswordParams {
  final dynamic data;

  ChangePasswordParams({required this.data});
}
