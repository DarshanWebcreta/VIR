import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/company/domain/repository/company_repo.dart';

class DeleteCompanyDetailUseCase implements UseCase<CommonModel, int> {
  final CompanyRepo companyRepo;

  DeleteCompanyDetailUseCase({required this.companyRepo});

  @override
  Future<Either<Failure, CommonModel>> call(int id) {
    return companyRepo.deleteCompanyDetail(id);
  }
}
