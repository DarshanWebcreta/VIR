import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';

import 'package:vir/features/subject/usecase/subject_usecase.dart';

import 'package:vir/injection.dart';

part 'subject_store.g.dart'; // Generated file

class SubjectStore = _SubjectStore with _$SubjectStore;

abstract class _SubjectStore with Store {
  @observable
  List<MasterData> subjectList = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> addSubject(dynamic request) async {
    Get.context!.loaderOverlay.show();
    final data = await getIt<AddSubjectUsecase>().call(AddSubjectParams(request: request));

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {
            Get.back();

            getSubjectList();
        FunctionalWidget.showSnackBar(title: r.message!, success: true);
      },
    );
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> getSubjectList() async {
    isLoading = true;
    final data = await getIt<SubjectListUsecase>().call(NoParams());

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {
            if(r.status==AppStrings.success){
              subjectList = r.data;

            }
            else{
              FunctionalWidget.showSnackBar(title: r.message, success: false);
            }
      },
    );
    isLoading = false;
  }

  @action
  Future<void> updateSubject(int id, dynamic request) async {
    Get.context!.loaderOverlay.show();
    final data = await getIt<UpdateSubjectUsecase>().call(UpdateSubjectParams(id: id, request: request));

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {

        FunctionalWidget.showSnackBar(title: r.message!, success: true);
        Get.back();
        getSubjectList();

      },
    );
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> deleteSubject(int id) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<DeleteSubjectUsecase>().call(DeleteSubjectParams(id: id));

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {

            getSubjectList();
        FunctionalWidget.showSnackBar(title: r.message!, success: true);
      },
    );
    Get.context!.loaderOverlay.hide();

  }
}
