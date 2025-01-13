import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/leave/domain/usecase/add_leave_usecase.dart';
import 'package:vir/features/leave/domain/usecase/fetch_leave_usecase.dart';

import 'package:vir/injection.dart';

part 'leave_store.g.dart';

class LeavesStore = _LeavesStore with _$LeavesStore;

abstract class _LeavesStore with Store {
  @observable
   List<MasterData> leaveList = [];


  @observable
  bool isLoading = false;

  @action
  Future<void> fetchLeavesList() async {
    isLoading = true;
    final data = await getIt<LeavesListUseCase>().call(NoParams());

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if(r.status == AppStrings.success){
        leaveList = r.data;
      }
    });

    isLoading = false;
  }

  @action
  Future<void> addLeaves(dynamic request) async {
    Get.context!.loaderOverlay.show();
    final params = AddLeavesParams(request: request);
    final data = await getIt<AddLeavesUseCase>().call(params);

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if(r.status == AppStrings.success){
        fetchLeavesList();
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
