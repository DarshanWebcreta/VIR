

import 'dart:convert';

import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/auth/data/model/login_model.dart';
import 'package:vir/features/dashboard/data/model/dashboard_count_model.dart';


abstract interface class DashboardRemoteRepo{
  Future<DashboardModel> dashboardApi();
  Future<CommonModel> monthWiseQuoteDownload(String body);

}

class DashboardImplRemoteRepo implements DashboardRemoteRepo{
  final ApiService apiService;


  DashboardImplRemoteRepo({required this.apiService});
  @override
  Future<CommonModel> monthWiseQuoteDownload(String body) {
    return apiService.monthWiseQuoteDownload(jsonEncode(body));
  }
  @override
  Future<DashboardModel> dashboardApi() {
    // TODO: implement dashboardApi
   return apiService.dashboardCount();
  }





}