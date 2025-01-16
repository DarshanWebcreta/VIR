import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';

import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/gst_tax/domain/usecase/gst_add_usecase.dart';
import 'package:vir/features/gst_tax/domain/usecase/gst_list_usecase.dart';
import 'package:vir/injection.dart';

part 'gst_store.g.dart';

class GstStore = _GstStore with _$GstStore;

abstract class _GstStore with Store {
  @observable
  List<MasterData> gstList = [];

  @observable
  bool isLoading = false;

  @observable
  String message = '';

  @action
  Future<void> fetchGstList() async {
    isLoading = true;
    final data = await getIt<FetchGstListUseCase>().call(NoParams());

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      if(result.status==AppStrings.success){
        gstList=result.data;
      }
    });
    isLoading = false;
  }

  @action
  Future<void> addGst(dynamic request) async {
    Get.context!.loaderOverlay.show();
    final data = await getIt<AddGstUseCase>().call(AddGstParams(data: request));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      message = result.message ?? '';
      if(result.status==AppStrings.success) {

        FunctionalWidget.showSnackBar(title: message, success: true);
        Get.back();
        fetchGstList();
      }
      else{
        FunctionalWidget.showSnackBar(title: message, success: false);

      }
    });

    Get.context!.loaderOverlay.hide();

  }
}
