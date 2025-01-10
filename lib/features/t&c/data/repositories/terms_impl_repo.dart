import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/t&c/data/repositories/terms_remote_repo.dart';
import 'package:vir/features/t&c/domain/repository/terms_repo.dart';


class TermsImplRepo implements TermsRepo {
  final TermsRemoteRepo termsRemoteRepo;

  TermsImplRepo({required this.termsRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> termList() async {
    try {
      final res = await termsRemoteRepo.termList();
      return right(res);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> updateTerm({required int id, required dynamic request}) async {
    try {
      final res = await termsRemoteRepo.updateTerm(id: id, request: request);
      return right(res);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addTerm({required dynamic request}) async {
    try {
      final res = await termsRemoteRepo.addTerm(request: request);
      return right(res);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> deleteTerm({required int id}) async {
    try {
      final res = await termsRemoteRepo.deleteTerm(id: id);
      return right(res);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
