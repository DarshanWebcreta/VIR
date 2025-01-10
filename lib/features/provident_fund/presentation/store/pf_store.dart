import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/provident_fund/domain/usecase/pf_usecase.dart';

import 'package:vir/injection.dart';

part 'pf_store.g.dart'; // Generated file

class PfStore = _PfStore with _$PfStore;

abstract class _PfStore with Store {
  @observable
  List<MasterData> pfList= [];



  @observable
  bool isLoading = false;

  @action
  Future<void> fetchPfList() async {
    isLoading = true;
    final data = await getIt<PfListUsecase>().call(NoParams());

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if(r.status==AppStrings.success){
        pfList = r.data;
      }
    });

    isLoading = false;
  }

  @action
  Future<void> addPf(dynamic request) async {
    Get.context!.loaderOverlay.show();
    final params = AddPfParams(request: request);
    final data = await getIt<AddPfUsecase>().call(params);

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      fetchPfList();
      Get.back();
      FunctionalWidget.showSnackBar(title: r.message!, success: true);

    });

    Get.context!.loaderOverlay.hide();

  }
}
