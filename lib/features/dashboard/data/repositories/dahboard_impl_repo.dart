

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/dashboard/data/model/dashboard_count_model.dart';
import 'package:vir/features/dashboard/data/repositories/dashboard_remote_repo.dart';
import 'package:vir/features/dashboard/domain/repository/dashboard_repo.dart';


class DashboardImplRepo implements DashboardRepo{
  final DashboardRemoteRepo dashboardRemoteRepo;

  DashboardImplRepo({required this.dashboardRemoteRepo});

  @override
  Future<Either<Failure, DashboardModel>> dashboardApi() async{
    try {
      final respo = await dashboardRemoteRepo.dashboardApi();
      return right(respo);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
  @override
  Future<Either<Failure, CommonModel>> monthWiseQuoteDownload(String body) async {
    try {
      final response = await dashboardRemoteRepo.monthWiseQuoteDownload(body);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}