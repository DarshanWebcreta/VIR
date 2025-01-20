import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/company/domain/repository/company_repo.dart';

class AddUpdateCompanyUsecase
    implements UseCase<CommonModel, AddUpdateCompanyParams> {
  final CompanyRepo companyRepo;

  AddUpdateCompanyUsecase({required this.companyRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddUpdateCompanyParams params) {
    return params.update
        ? companyRepo.updateCompany(
            id: params.id!,
      companyName: params.companyName,
      pfNo: params.pfNo,
      regNo: params.regNo,
      serTax: params.serTax,
      gstNo: params.gstNo,
      profTax: params.profTax,
      panNo: params.panNo,
      gujPoliceNo: params.gujPoliceNo,
      rjPoliceNo: params.rjPoliceNo,
      logo: params.logo,)
        : companyRepo.addCompanyApi(
            companyName: params.companyName,
            pfNo: params.pfNo,
            regNo: params.regNo,
            serTax: params.serTax,
            gstNo: params.gstNo,
            profTax: params.profTax,
            panNo: params.panNo,
            gujPoliceNo: params.gujPoliceNo,
            rjPoliceNo: params.rjPoliceNo,
            logo: params.logo,
          );
  }
}

class AddUpdateCompanyParams {
  final String companyName;
  final String pfNo;
  final int? id;
  final String regNo;
  final String serTax;
  final String gstNo;
  final String profTax;
  final String panNo;
  final String gujPoliceNo;
  final String rjPoliceNo;
  final bool update;
  File? logo;

  AddUpdateCompanyParams({
    required this.companyName,
    required this.pfNo,
     this.id,
    required this.update,
    required this.regNo,
    required this.serTax,
    required this.gstNo,
    required this.profTax,
    required this.panNo,
    required this.gujPoliceNo,
    required this.rjPoliceNo,
    this.logo,
  });
}
