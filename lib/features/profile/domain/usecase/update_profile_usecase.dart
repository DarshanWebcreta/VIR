import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/profile/domain/repository/profile_repository.dart';

class UpdateProfileUseCase implements UseCase<CommonModel, UpdateProfileParams> {
  final ProfileRepo profileRepo;

  UpdateProfileUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, CommonModel>> call(UpdateProfileParams params) {
    return profileRepo.updateProfile(data: params.data);
  }
}

class UpdateProfileParams {
  final dynamic data;

  UpdateProfileParams({required this.data});
}

