import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/profile/domain/usecase/fetch_profile_usecase.dart';
import 'package:vir/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:vir/features/profile/domain/usecase/change_password_usecase.dart';
import 'package:vir/features/profile/data/model/profile_model.dart';

import 'package:vir/core/utils/function_component.dart';
import 'package:vir/injection.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  ProfileModel? profileModel;

  @observable
  bool isLoading = false;

  @observable
  String message = '';

  @action
  Future<void> fetchProfile() async {
    isLoading = true;
    final data = await getIt<FetchProfileUseCase>().call(NoParams());

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      profileModel = result;
    });
    isLoading = false;
  }

  @action
  Future<void> updateProfile(dynamic request) async {
    Get.context!.loaderOverlay.show();
    final data = await getIt<UpdateProfileUseCase>().call(UpdateProfileParams(data: request));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      message = result.message ?? '';
      fetchProfile();
      FunctionalWidget.showSnackBar(title: message, success: true);
    });
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> changePassword(dynamic request) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<ChangePasswordUseCase>().call(ChangePasswordParams(data: request));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      message = result.message ?? '';
      FunctionalWidget.showSnackBar(title: message, success: true);
    });
    Get.context!.loaderOverlay.hide();

  }
}
