import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';

import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/category/data/repositories/category_remote_repo.dart';
import 'package:vir/features/category/domain/repository/category_repo.dart';

class CategoryImplRepo implements CategoryRepo {
  final CategoryRemoteRepo categoryRemoteRepo;

  CategoryImplRepo({required this.categoryRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> categoryList() async {
    try {
      final response = await categoryRemoteRepo.categoryList();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
  @override
  Future<Either<Failure, CommonModel>> addCategory(dynamic request) async {
    try {
      final response = await categoryRemoteRepo.addCategory(request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
  @override
  Future<Either<Failure, CommonModel>> updateCategory(int id, dynamic request) async {
    try {
      final response = await categoryRemoteRepo.updateCategory(id, request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> deleteCategory(int id) async {
    try {
      final response = await categoryRemoteRepo.deleteCategory(id);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
