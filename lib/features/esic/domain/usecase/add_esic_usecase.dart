import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/esic/domain/repository/esic_repo.dart';

class AddEsicUsecase implements UseCase<CommonModel, AddEsicParams> {
  final EsicRepo esicRepo;

  AddEsicUsecase({required this.esicRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddEsicParams params) {
    return esicRepo.addEsicApi(params.request);
  }
}

class AddEsicParams {
  final dynamic request;

  AddEsicParams({required this.request});
}
