import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';

import 'package:vir/features/esic/domain/usecase/add_esic_usecase.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/esic/domain/usecase/get_esic_usecase.dart';

import 'package:vir/injection.dart';

part 'esic_store.g.dart'; // Generated file

class EsicStore = _EsicStore with _$EsicStore;

abstract class _EsicStore with Store {
  @observable
  List<MasterData> esicList = [];



  @observable
  bool isLoading = false;

  @action
  Future<void> fetchEsicList() async {
    isLoading = true;
    final data = await getIt<EsicListUsecase>().call(NoParams());

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      esicList = r.data;
    });

    isLoading = false;
  }

  @action
  Future<void> addEsic(dynamic request) async {
    Get.context!.loaderOverlay.show();
    final params = AddEsicParams(request: request);
    final data = await getIt<AddEsicUsecase>().call(params);

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if(r.status==AppStrings.success){
        fetchEsicList();
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
