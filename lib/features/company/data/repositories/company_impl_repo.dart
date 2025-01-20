
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:vir/core/common/common_model.dart';

import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/company/data/model/company_model.dart';
import 'package:vir/features/company/domain/repository/company_repo.dart';
import 'company_remote_repo.dart';


class CompanyImplRepo implements CompanyRepo {
  final CompanyRemoteRepo companyRemoteRepo;

  CompanyImplRepo({required this.companyRemoteRepo});
  @override
  Future<Either<Failure, CommonModel>> deleteCompanyDetail(int id) async {
    try {
      final response = await companyRemoteRepo.deleteCompanyDetail(id);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
  @override
  Future<Either<Failure, CompanyModel>> companyList() async {
    try {
      final response = await companyRemoteRepo.companyList();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addCompanyApi({required String companyName, required String pfNo, required String regNo, required String serTax,
    required String gstNo, required String profTax, required String panNo, required String gujPoliceNo, required String rjPoliceNo,  File? logo}) async{
    try {
      final response = await companyRemoteRepo.addCompanyApi(
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
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> updateCompany({required int id, required String companyName, required String pfNo, required String regNo, required String serTax, required String gstNo, required String profTax, required String panNo,
    required String gujPoliceNo, required String rjPoliceNo, File? logo}) async{
    try {
      final response = await companyRemoteRepo.updateCompany(
        id: id,
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
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }




}
