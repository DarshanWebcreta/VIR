import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/common/multipart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/company/domain/repository/company_repo.dart';
import 'package:dio/dio.dart';

class AddCompanyUsecase implements UseCase<CommonModel, AddCompanyParams> {
  final CompanyRepo companyRepo;

  AddCompanyUsecase({required this.companyRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddCompanyParams params) {
    return companyRepo.addCompanyApi(
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

class AddCompanyParams {
  final String companyName;
  final String pfNo;
  final String regNo;
  final String serTax;
  final String gstNo;
  final String profTax;
  final String panNo;
  final String gujPoliceNo;
  final String rjPoliceNo;
   File? logo;

  AddCompanyParams({
    required this.companyName,
    required this.pfNo,
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
