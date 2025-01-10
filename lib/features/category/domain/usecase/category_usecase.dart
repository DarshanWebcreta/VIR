import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/category/domain/repository/category_repo.dart';

class CategoryListUsecase implements UseCase<MasterModel, NoParams> {
  final CategoryRepo categoryRepo;

  CategoryListUsecase({required this.categoryRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams params) {
    return categoryRepo.categoryList();
  }
}
class AddCategoryUsecase implements UseCase<CommonModel, AddCategoryParams> {
  final CategoryRepo categoryRepo;

  AddCategoryUsecase({required this.categoryRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddCategoryParams params) {
    return categoryRepo.addCategory(params.request);
  }
}

class AddCategoryParams {
  final dynamic request;

  AddCategoryParams({required this.request});
}

class UpdateCategoryUsecase implements UseCase<CommonModel, UpdateCategoryParams> {
  final CategoryRepo categoryRepo;

  UpdateCategoryUsecase({required this.categoryRepo});

  @override
  Future<Either<Failure, CommonModel>> call(UpdateCategoryParams params) {
    return categoryRepo.updateCategory(params.id, params.request);
  }
}

class DeleteCategoryUsecase implements UseCase<CommonModel, DeleteCategoryParams> {
  final CategoryRepo categoryRepo;

  DeleteCategoryUsecase({required this.categoryRepo});

  @override
  Future<Either<Failure, CommonModel>> call(DeleteCategoryParams params) {
    return categoryRepo.deleteCategory(params.id);
  }
}

class UpdateCategoryParams {
  final int id;
  final dynamic request;

  UpdateCategoryParams({required this.id, required this.request});
}

class DeleteCategoryParams {
  final int id;

  DeleteCategoryParams({required this.id});
}
