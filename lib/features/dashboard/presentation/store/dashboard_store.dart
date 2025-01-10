
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/operation_file.dart';
import 'package:vir/features/dashboard/data/model/dashboard_count_model.dart';
import 'package:vir/features/dashboard/domain/usecase/dashboard_usecase.dart';
import 'package:vir/features/dashboard/domain/usecase/month_wise_quote_gen.dart';

import 'package:vir/injection.dart';


part 'dashboard_store.g.dart'; // Generated file

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {

   @observable
   DashboardModel? dashboardModel;

   @observable
   bool isLoading = false;

   @observable
   String startDate = '';

   @observable
   String endDate = '';

  @action
  Future<void> callApi() async {
    isLoading = true;
    final data  = await getIt<DashboardUsecase>().call(NoParams());

    data.fold((l) {

      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {

      if(r.status==AppStrings.success){
        dashboardModel  = r;
      }
      else{
        FunctionalWidget.showSnackBar(title: r.message, success: false);
      }

    },);
    isLoading = false;
  }
   Future<void> monthWiseQuoteDownload(dynamic body) async {
    Get.context!.loaderOverlay.show();
     final data = await getIt<MonthWiseQuoteDownloadUseCase>().call(MonthWiseQuoteDownloadParams(body: body));

     data.fold(
           (l) {
         FunctionalWidget.showSnackBar(title: l.message, success: false);
       },
           (r) {
         if (r.status == AppStrings.success) {
           Operation.redirectToBrowser(r.data);

         } else {
           FunctionalWidget.showSnackBar(title: r.message!, success: false);
         }
       },
     );
    Get.context!.loaderOverlay.hide();

   }

}
