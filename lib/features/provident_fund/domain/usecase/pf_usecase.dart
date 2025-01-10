import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/category/data/model/category_model.dart';

import 'package:vir/features/provident_fund/domain/repository/pf_repo.dart';

class PfListUsecase implements UseCase<MasterModel, NoParams> {
  final PfRepo pfRepo;

  PfListUsecase({required this.pfRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams) {
    return pfRepo.pfListApi();
  }
}
class AddPfUsecase implements UseCase<CommonModel, AddPfParams> {
  final PfRepo pfRepo;

  AddPfUsecase({required this.pfRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddPfParams params) {
    return pfRepo.addPfApi(params.request);
  }
}

class AddPfParams {
  final dynamic request;

  AddPfParams({required this.request});
}