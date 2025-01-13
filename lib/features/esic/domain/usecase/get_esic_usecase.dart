import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/category/data/model/category_model.dart';

import 'package:vir/features/esic/domain/repository/esic_repo.dart';

class EsicListUsecase implements UseCase<MasterModel, NoParams> {
  final EsicRepo esicRepo;

  EsicListUsecase({required this.esicRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams params) {
    return esicRepo.esicListApi();
  }
}
