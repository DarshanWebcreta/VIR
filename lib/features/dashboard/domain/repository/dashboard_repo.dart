import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/dashboard/data/model/dashboard_count_model.dart';


abstract interface class DashboardRepo{
  Future<Either<Failure,DashboardModel>> dashboardApi();
  Future<Either<Failure, CommonModel>> monthWiseQuoteDownload(String body);

}