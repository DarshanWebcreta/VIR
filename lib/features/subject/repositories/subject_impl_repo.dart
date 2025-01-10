import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';

import 'package:vir/features/category/data/model/category_model.dart';

import 'package:vir/features/subject/repositories/subject_remote_repo.dart';
import 'package:vir/features/subject/repository/subject_repo.dart';

class SubjectImplRepo implements SubjectRepo {
  final SubjectRemoteRepo subjectRemoteRepo;

  SubjectImplRepo({required this.subjectRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> subjectList() async {
    try {
      final response = await subjectRemoteRepo.subjectList();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
  @override
  Future<Either<Failure, CommonModel>> addSubject(dynamic request) async {
    try {
      final response = await subjectRemoteRepo.addSubject(request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
  @override
  Future<Either<Failure, CommonModel>> updateSubject(int id, dynamic request) async {
    try {
      final response = await subjectRemoteRepo.updateSubject(id, request);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> deleteSubject(int id) async {
    try {
      final response = await subjectRemoteRepo.deleteSubject(id);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
