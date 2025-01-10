import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/utils/function_component.dart';

import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/t&c/domain/usecase/terms_usecase.dart';


import 'package:vir/injection.dart';

part 'terms_store.g.dart'; // Generated file

class TermsStore = _TermsStore with _$TermsStore;

abstract class _TermsStore with Store {
  @observable
  List<MasterData> termsList = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchTermList() async {
    isLoading = true;
    final data = await getIt<TermListUsecase>().call(NoParams());

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if (r.status == AppStrings.success) {
        termsList = r.data;
      } else {
        FunctionalWidget.showSnackBar(title: r.message, success: false);
      }
    });
    isLoading = false;
  }

  @action
  Future<void> addTerm(dynamic request) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<AddTermUsecase>().call(AddTermParams(request: request));

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if (r.status == AppStrings.success) {
        Get.back();
         fetchTermList(); // Refresh the term list after adding
        FunctionalWidget.showSnackBar(title: "Term added successfully!", success: true);
      } else {
        FunctionalWidget.showSnackBar(title: r.message!, success: false);
      }
    });
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> updateTerm(int id, dynamic request) async {
    Get.context!.loaderOverlay.show();
    final data = await getIt<UpdateTermUsecase>().call(UpdateTermParams(id: id, request: request));

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) async{
      if (r.status == AppStrings.success) {
         fetchTermList(); // Refresh the term list after updating
         Get.back();
        FunctionalWidget.showSnackBar(title: "Term updated successfully!", success: true);
      } else {
        FunctionalWidget.showSnackBar(title: r.message!, success: false);
      }
    });
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> deleteTerm(int id) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<DeleteTermUsecase>().call(DeleteTermParams(id: id));

    data.fold((l) {
      FunctionalWidget.showSnackBar(title: l.message, success: false);
    }, (r) {
      if (r.status == AppStrings.success) {
         fetchTermList(); // Refresh the term list after deleting
        FunctionalWidget.showSnackBar(title: "Term deleted successfully!", success: true);
      } else {
        FunctionalWidget.showSnackBar(title: r.message!, success: false);
      }
    });
    Get.context!.loaderOverlay.hide();

  }
}
