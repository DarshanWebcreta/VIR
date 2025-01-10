import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/common/multipart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/company/data/model/company_model.dart';


abstract interface class CompanyRepo {
  Future<Either<Failure, CompanyModel>> companyList();
  Future<Either<Failure, CommonModel>> deleteCompanyDetail(int id);
  Future<Either<Failure, CommonModel>> addCompanyApi({
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
