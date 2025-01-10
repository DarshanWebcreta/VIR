import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class PfRemoteRepo {
  Future<MasterModel> pfListApi();
  Future<CommonModel> addPfApi(dynamic request);
}

class PfImplRemoteRepo implements PfRemoteRepo {
  final ApiService apiService;

  PfImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> pfListApi() {
    return apiService.pfList();
  }

  @override
  Future<CommonModel> addPfApi(dynamic request) {
    return apiService.addPf(request);
  }
}
