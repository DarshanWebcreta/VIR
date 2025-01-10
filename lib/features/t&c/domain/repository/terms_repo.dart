import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class TermsRepo {
  Future<Either<Failure, MasterModel>> termList();
  Future<Either<Failure, CommonModel>> updateTerm({required int id, required dynamic request});
  Future<Either<Failure, CommonModel>> addTerm({required dynamic request});
  Future<Either<Failure, CommonModel>> deleteTerm({required int id});
}
