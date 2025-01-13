import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';

import 'package:vir/core/common/common_model.dart';

import 'package:vir/features/gst_tax/data/repositories/gst_remote_repo.dart';
import 'package:vir/features/gst_tax/domain/repository/gst_repo.dart';

class GstImplRepo implements GstRepo {
  final GstRemoteRepo gstRemoteRepo;

  GstImplRepo({required this.gstRemoteRepo});

  @override
  Future<Either<Failure, MasterModel>> fetchGstList() async {
    try {
      final response = await gstRemoteRepo.fetchGstList();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addGst({required dynamic data}) async {
    try {
      final response = await gstRemoteRepo.addGst(data: data);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
