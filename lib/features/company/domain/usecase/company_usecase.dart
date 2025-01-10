import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/company/data/model/company_model.dart';
import 'package:vir/features/company/domain/repository/company_repo.dart';

class CompanyUsecase implements UseCase<CompanyModel, NoParams> {
  final CompanyRepo companyRepo;

  CompanyUsecase({required this.companyRepo});

  @override
  Future<Either<Failure, CompanyModel>> call(NoParams params) {
    return companyRepo.companyList();
  }
}
