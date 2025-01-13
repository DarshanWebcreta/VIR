import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';

import 'package:vir/features/bonus/data/repositories/bonus_remote_repo.dart';
import 'package:vir/features/bonus/domain/repository/bonus_repo.dart';
import 'package:vir/features/category/data/model/category_model.dart';

class BonusImplRepo implements BonusRepo {
  final BonusRemoteRepo bonusRemoteRepo;

  BonusImplRepo({required this.bonusRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> bonusListApi() async {
    try {
      final response = await bonusRemoteRepo.bonusListApi();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addBonusApi(dynamic request) async {
    try {
      final response = await bonusRemoteRepo.addBonusApi(request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
