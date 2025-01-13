import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';

abstract interface class EsicRemoteRepo {
  Future<MasterModel> esicListApi();
  Future<CommonModel> addEsicApi(dynamic request);
}

class EsicImplRemoteRepo implements EsicRemoteRepo {
  final ApiService apiService;

  EsicImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> esicListApi() {
    return apiService.esicList();
  }

  @override
  Future<CommonModel> addEsicApi(dynamic request) {
    return apiService.addEsic(request);
  }
}
