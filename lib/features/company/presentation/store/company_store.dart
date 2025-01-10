import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/common/multipart.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/company/domain/entities/company_data.dart';
import 'package:vir/features/company/domain/usecase/add_company_usecase.dart';
import 'package:vir/features/company/domain/usecase/company_usecase.dart';
import 'package:vir/features/company/domain/usecase/delete_company_usecase.dart';
import 'package:vir/injection.dart';

part 'company_store.g.dart'; // Generated file

class CompanyStore = _CompanyStore with _$CompanyStore;

abstract class _CompanyStore with Store {
  @observable
  List<CompanyData> companyList = [];

  @observable
  bool isLoading = false;

  @observable
  String startDate = '';

  @observable
  String selectedCompanyName = '';

  @observable
  int selectedCompanyId= 0;

  @observable
  String endDate = '';

  @action
  Future<void> callApi() async {
    isLoading = true;
    final data = await getIt<CompanyUsecase>().call(NoParams());

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {
        if (r.status == AppStrings.success) {
          companyList = r.data;
        } else {
          FunctionalWidget.showSnackBar(title: r.message, success: false);
        }
      },
    );
    isLoading = false;
  }


  @action
  Future<void> addCompany({
    required String companyName,
    required String pfNo,
    required String regNo,
    required String serTax,
    required String gstNo,
    required String profTax,
    required String panNo,
    required String gujPoliceNo,
    required String rjPoliceNo,
     File? logo,
  }) async {
    Get.context!.loaderOverlay.show();
    final params = AddCompanyParams(
      companyName: companyName,
      pfNo: pfNo,
      regNo: regNo,
      serTax: serTax,
      gstNo: gstNo,
      profTax: profTax,
      panNo: panNo,
      gujPoliceNo: gujPoliceNo,
      rjPoliceNo: rjPoliceNo,
      logo: logo,
    );
    final data = await getIt<AddCompanyUsecase>().call(params);

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {
        if (r.status == AppStrings.success) {
          FunctionalWidget.showSnackBar(title: r.message!, success: true);

          Get.back();
        } else {
          FunctionalWidget.showSnackBar(title: r.message!, success: false);
        }
      },
    );
    Get.context!.loaderOverlay.hide();


  }

  @action
  Future<void> deleteCompany(int id) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<DeleteCompanyDetailUseCase>().call(id);

    data.fold(
          (l) {
        FunctionalWidget.showSnackBar(title: l.message, success: false);
      },
          (r) {
        if (r.status == AppStrings.success) {
          callApi();
          FunctionalWidget.showSnackBar(title: r.message!, success: true);

        } else {
          FunctionalWidget.showSnackBar(title: r.message!, success: false);
        }
      },
    );
    Get.context!.loaderOverlay.hide();

  }
}
