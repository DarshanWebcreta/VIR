import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class EsicRepo {
  Future<Either<Failure, MasterModel>> esicListApi();
  Future<Either<Failure, CommonModel>> addEsicApi(dynamic request);
}