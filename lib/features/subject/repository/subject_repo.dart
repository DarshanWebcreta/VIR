import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/category/data/model/category_model.dart';


abstract interface class SubjectRepo {
  Future<Either<Failure, MasterModel>> subjectList();
  Future<Either<Failure, CommonModel>> updateSubject(int id, dynamic request);
  Future<Either<Failure, CommonModel>> deleteSubject(int id);
  Future<Either<Failure, CommonModel>> addSubject(dynamic request);
}
