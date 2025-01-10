import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class CategoryRepo {
  Future<Either<Failure, MasterModel>> categoryList();
  Future<Either<Failure, CommonModel>> updateCategory(int id, dynamic request);
  Future<Either<Failure, CommonModel>> deleteCategory(int id);
  Future<Either<Failure, CommonModel>> addCategory(dynamic request);

}
