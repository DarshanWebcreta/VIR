import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class BonusRepo {
  Future<Either<Failure, MasterModel>> bonusListApi();
  Future<Either<Failure, CommonModel>> addBonusApi(dynamic request);
}
