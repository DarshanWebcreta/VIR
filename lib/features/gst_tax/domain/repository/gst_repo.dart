import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';

import 'package:vir/core/common/common_model.dart';

abstract interface class GstRepo {
  Future<Either<Failure, MasterModel>> fetchGstList();
  Future<Either<Failure, CommonModel>> addGst({required dynamic data});
}
