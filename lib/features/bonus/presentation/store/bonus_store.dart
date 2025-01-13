import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/bonus/domain/usecase/bonus_add_usecase.dart';
import 'package:vir/features/bonus/domain/usecase/bonus_fetch_usecase.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';

import 'package:vir/injection.dart';

part 'bonus_store.g.dart'; // Generated file

class BonusStore = _BonusStore with _$BonusStore;

abstract class _BonusStore with Store {
  @observable
  List<MasterData> bonusList = [];


  @observable
  bool isLoading = false;

  @action
  Future<void> fetchBonusList() async {
    isLoading = true;
    final data = await getIt<BonusListUseCase>().call(NoParams());

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      bonusList = r.data;
    });

    isLoading = false;
  }

  @action
  Future<void> addBonus(dynamic request) async {
   Get.context!.loaderOverlay.show();
    final params = AddBonusParams(request: request);
    final data = await getIt<AddBonusUseCase>().call(params);

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if(r.status==AppStrings.success){
        fetchBonusList();
        Get.back();
        FunctionalWidget.showSnackBar(title: r.message!, success: true);

      }
      else{
        FunctionalWidget.showSnackBar(title: r.message!, success: false);

      }
    });

   Get.context!.loaderOverlay.hide();

  }
}
