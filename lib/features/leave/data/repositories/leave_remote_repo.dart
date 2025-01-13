import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class LeavesRemoteRepo {
  Future<MasterModel> leavesListApi();
  Future<CommonModel> addLeavesApi(dynamic request);
}

class LeavesImplRemoteRepo implements LeavesRemoteRepo {
  final ApiService apiService;

  LeavesImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> leavesListApi() {
    return apiService.leavesList();
  }

  @override
  Future<CommonModel> addLeavesApi(dynamic request) {
    return apiService.addLeaves(request);
  }
}
