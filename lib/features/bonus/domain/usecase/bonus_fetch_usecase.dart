import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/bonus/domain/repository/bonus_repo.dart';
import 'package:vir/features/category/data/model/category_model.dart';

class BonusListUseCase implements UseCase<MasterModel, NoParams> {
  final BonusRepo bonusRepo;

  BonusListUseCase({required this.bonusRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams params) {
    return bonusRepo.bonusListApi();
  }
}
