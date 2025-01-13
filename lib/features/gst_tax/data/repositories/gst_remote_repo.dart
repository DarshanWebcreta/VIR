import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';

import 'package:vir/core/common/common_model.dart';

abstract interface class GstRemoteRepo {
  Future<MasterModel> fetchGstList();
  Future<CommonModel> addGst({required dynamic data});
}

class GstImplRemoteRepo implements GstRemoteRepo {
  final ApiService apiService;

  GstImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> fetchGstList() {
    return apiService.gstList();
  }

  @override
  Future<CommonModel> addGst({required dynamic data}) {
    return apiService.addGst(data);
  }
}
