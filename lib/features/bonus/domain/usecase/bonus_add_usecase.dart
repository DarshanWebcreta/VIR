import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/bonus/domain/repository/bonus_repo.dart';

class AddBonusUseCase implements UseCase<CommonModel, AddBonusParams> {
  final BonusRepo bonusRepo;

  AddBonusUseCase({required this.bonusRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddBonusParams params) {
    return bonusRepo.addBonusApi(params.request);
  }
}

class AddBonusParams {
  final dynamic request;

  AddBonusParams({required this.request});
}
