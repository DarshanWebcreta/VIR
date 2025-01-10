import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class PfRepo {
  Future<Either<Failure, MasterModel>> pfListApi();
  Future<Either<Failure, CommonModel>> addPfApi(dynamic request);
}
