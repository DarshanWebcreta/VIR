import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';

import 'package:vir/features/esic/data/repositories/esic_remote_repo.dart';
import 'package:vir/features/esic/domain/repository/esic_repo.dart';

class EsicImplRepo implements EsicRepo {
  final EsicRemoteRepo esicRemoteRepo;

  EsicImplRepo({required this.esicRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> esicListApi() async {
    try {
      final response = await esicRemoteRepo.esicListApi();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addEsicApi(dynamic request) async {
    try {
      final response = await esicRemoteRepo.addEsicApi(request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
