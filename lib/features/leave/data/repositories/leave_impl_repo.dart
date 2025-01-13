import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/leave/data/repositories/leave_remote_repo.dart';
import 'package:vir/features/leave/domain/repository/leave_repo.dart';


class LeavesImplRepo implements LeavesRepo {
  final LeavesRemoteRepo leavesRemoteRepo;

  LeavesImplRepo({required this.leavesRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> leavesListApi() async {
    try {
      final response = await leavesRemoteRepo.leavesListApi();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addLeavesApi(dynamic request) async {
    try {
      final response = await leavesRemoteRepo.addLeavesApi(request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
