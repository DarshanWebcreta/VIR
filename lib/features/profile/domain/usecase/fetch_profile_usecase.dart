import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/profile/data/model/profile_model.dart';
import 'package:vir/features/profile/domain/repository/profile_repository.dart';

class FetchProfileUseCase implements UseCase<ProfileModel, NoParams> {
  final ProfileRepo profileRepo;

  FetchProfileUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, ProfileModel>> call(NoParams) {
    return profileRepo.fetchProfile();
  }
}
