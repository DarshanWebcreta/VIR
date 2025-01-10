import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class TermsRemoteRepo {
  Future<MasterModel> termList();
  Future<CommonModel> updateTerm({required int id, required dynamic request});
  Future<CommonModel> addTerm({required dynamic request});
  Future<CommonModel> deleteTerm({required int id});
}

class TermsImplRemoteRepo implements TermsRemoteRepo {
  final ApiService apiService;

  TermsImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> termList() {
    return apiService.termList();
  }

  @override
  Future<CommonModel> updateTerm({required int id, required dynamic request}) {
    return apiService.updateTerm(id, request);
  }

  @override
  Future<CommonModel> addTerm({required dynamic request}) {
    return apiService.addTerm(request);
  }

  @override
  Future<CommonModel> deleteTerm({required int id}) {
    return apiService.deleteTerm(id);
  }
}
