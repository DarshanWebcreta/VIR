import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';

abstract interface class BonusRemoteRepo {
  Future<MasterModel> bonusListApi();
  Future<CommonModel> addBonusApi(dynamic request);
}

class BonusImplRemoteRepo implements BonusRemoteRepo {
  final ApiService apiService;

  BonusImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> bonusListApi() {
    return apiService.bonusList();
  }

  @override
  Future<CommonModel> addBonusApi(dynamic request) {
    return apiService.addBonus(request);
  }
}
