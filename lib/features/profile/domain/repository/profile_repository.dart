import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/profile/data/model/profile_model.dart';
import 'package:vir/core/common/common_model.dart';

abstract interface class ProfileRepo {
  Future<Either<Failure, ProfileModel>> fetchProfile();
  Future<Either<Failure, CommonModel>> updateProfile({required dynamic data});
  Future<Either<Failure, CommonModel>> changePassword({required dynamic data});
}
