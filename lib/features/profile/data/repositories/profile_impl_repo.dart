import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/profile/data/model/profile_model.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/profile/data/repositories/profile_remote_repo.dart';
import 'package:vir/features/profile/domain/repository/profile_repository.dart';


class ProfileImplRepo implements ProfileRepo {
  final ProfileRemoteRepo profileRemoteRepo;

  ProfileImplRepo({required this.profileRemoteRepo});

  @override
  Future<Either<Failure, ProfileModel>> fetchProfile() async {
    try {
      final response = await profileRemoteRepo.fetchProfile();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> updateProfile({required dynamic data}) async {
    try {
      final response = await profileRemoteRepo.updateProfile(data: data);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> changePassword({required dynamic data}) async {
    try {
      final response = await profileRemoteRepo.changePassword(data: data);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
