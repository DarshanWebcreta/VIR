import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class LeavesRepo {
  Future<Either<Failure, MasterModel>> leavesListApi();
  Future<Either<Failure, CommonModel>> addLeavesApi(dynamic request);
}
