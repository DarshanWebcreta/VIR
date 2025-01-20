import 'dart:convert';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/key/storage_keys.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/storage/app_storage.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/auth/domain/usecase/login_usecase.dart';
import 'package:vir/injection.dart';


part 'login_store.g.dart'; // Generated file

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {


  @action
  Future<void> login({required var loginRowData}) async {
    Get.context!.loaderOverlay.show();

    final data  = await getIt<LoginUsecase>().call(LoginParams(data:jsonEncode(loginRowData) ));

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if(r.status==AppStrings.success){
        FunctionalWidget.showSnackBar(title: r.message, success: true);
        StorageManager.saveData(StoreKeys.token, r.accessToken);
        StorageManager.saveData(StoreKeys.userId, r.data?.id);
        Get.offAllNamed(RoutesNames.mainPage);
      }
      else{
        FunctionalWidget.showSnackBar(title: r.message, success: false);

      }
    },);

    Get.context!.loaderOverlay.hide();
  }
}
