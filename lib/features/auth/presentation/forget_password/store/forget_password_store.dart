
import 'dart:convert';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:vir/injection.dart';


part 'forget_password_store.g.dart'; // Generated file

class ForgetPasswordStore = _ForgetPasswordStore with _$ForgetPasswordStore;

abstract class _ForgetPasswordStore with Store {


  @action
  Future<void> forgetPassword({required var loginRowData}) async {
    Get.context!.loaderOverlay.show();

    final data  = await getIt<ForgetPasswordUsecase>().call(ForgetPasswordParams(data:jsonEncode(loginRowData) ));

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if(r.status==AppStrings.success){
        FunctionalWidget.showSnackBar(title: r.message??'', success: true);
      }
      else{
        FunctionalWidget.showSnackBar(title: r.message??'', success: false);

      }
    },);

    Get.context!.loaderOverlay.hide();
  }
}
