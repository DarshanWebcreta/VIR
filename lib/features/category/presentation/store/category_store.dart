import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/category/domain/usecase/category_usecase.dart';

import 'package:vir/injection.dart';

part 'category_store.g.dart'; // Generated file

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  @observable
  List<MasterData> categoryList = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> addCategory(dynamic request) async {
    Get.context!.loaderOverlay.show();
    final data = await getIt<AddCategoryUsecase>().call(AddCategoryParams(request: request));

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {
            Get.back();

            getCategoryList();
        FunctionalWidget.showSnackBar(title: r.message!, success: true);
      },
    );
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> getCategoryList() async {
    isLoading = true;
    final data = await getIt<CategoryListUsecase>().call(NoParams());

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {
            if(r.status==AppStrings.success){
              categoryList = r.data;

            }
            else{
              FunctionalWidget.showSnackBar(title: r.message, success: false);
            }
      },
    );
    isLoading = false;
  }

  @action
  Future<void> updateCategory(int id, dynamic request) async {
    Get.context!.loaderOverlay.show();
    final data = await getIt<UpdateCategoryUsecase>().call(UpdateCategoryParams(id: id, request: request));

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {

        FunctionalWidget.showSnackBar(title: r.message!, success: true);
        Get.back();
        getCategoryList();

      },
    );
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> deleteCategory(int id) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<DeleteCategoryUsecase>().call(DeleteCategoryParams(id: id));

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {

            getCategoryList();
        FunctionalWidget.showSnackBar(title: r.message!, success: true);
      },
    );
    Get.context!.loaderOverlay.hide();

  }
}
