



import 'dart:io';

import 'package:vir/core/common/common_model.dart';

import 'package:vir/data/api_service.dart';
import 'package:vir/features/company/data/model/company_model.dart';

abstract interface class CompanyRemoteRepo {
  Future<CompanyModel> companyList();
  Future<CommonModel> deleteCompanyDetail(int id);
  Future<CommonModel> updateCompany({
    required int id,
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
  });
  Future<CommonModel> addCompanyApi({
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
  });
}



class CompanyImplRemoteRepo implements CompanyRemoteRepo {
  final ApiService apiService;

  CompanyImplRemoteRepo({required this.apiService});

  @override
  Future<CompanyModel> companyList() {
    return apiService.companyList();
  }
  @override
  Future<CommonModel> deleteCompanyDetail(int id) {
    return apiService.deleteCompanyDetail(id);
  }
  @override
  Future<CommonModel> addCompanyApi({
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
  }) {
    return apiService.addCompany(
     companyName,
       pfNo,
       regNo,
      serTax,
     gstNo,
     profTax,
      panNo,
      gujPoliceNo,
     rjPoliceNo,
      logo
    );
  }

  @override
  Future<CommonModel> updateCompany({
    required int id,
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
  }) {
    return apiService.updateCompanyDetails(id, companyName, regNo,
        pfNo, serTax, gstNo, profTax, panNo,
        gujPoliceNo, rjPoliceNo, logo);

  }
}
