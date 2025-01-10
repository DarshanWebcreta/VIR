import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/provident_fund/data/repositories/pf_remote_repo.dart';
import 'package:vir/features/provident_fund/domain/repository/pf_repo.dart';


class PfImplRepo implements PfRepo {
  final PfRemoteRepo pfRemoteRepo;

  PfImplRepo({required this.pfRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> pfListApi() async {
    try {
      final response = await pfRemoteRepo.pfListApi();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addPfApi(dynamic request) async {
    try {
      final response = await pfRemoteRepo.addPfApi(request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
