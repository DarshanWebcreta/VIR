import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/t&c/domain/repository/terms_repo.dart';


class TermListUsecase implements UseCase<MasterModel, NoParams> {
  final TermsRepo termsRepo;

  TermListUsecase({required this.termsRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams params) {
    return termsRepo.termList();
  }
}

class UpdateTermUsecase implements UseCase<CommonModel, UpdateTermParams> {
  final TermsRepo termsRepo;

  UpdateTermUsecase({required this.termsRepo});

  @override
  Future<Either<Failure, CommonModel>> call(UpdateTermParams params) {
    return termsRepo.updateTerm(id: params.id, request: params.request);
  }
}

class AddTermUsecase implements UseCase<CommonModel, AddTermParams> {
  final TermsRepo termsRepo;

  AddTermUsecase({required this.termsRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddTermParams params) {
    return termsRepo.addTerm(request: params.request);
  }
}

class DeleteTermUsecase implements UseCase<CommonModel, DeleteTermParams> {
  final TermsRepo termsRepo;

  DeleteTermUsecase({required this.termsRepo});

  @override
  Future<Either<Failure, CommonModel>> call(DeleteTermParams params) {
    return termsRepo.deleteTerm(id: params.id);
  }
}

class UpdateTermParams {
  final int id;
  final dynamic request;

  UpdateTermParams({required this.id, required this.request});
}

class AddTermParams {
  final dynamic request;

  AddTermParams({required this.request});
}

class DeleteTermParams {
  final int id;

  DeleteTermParams({required this.id});
}
