import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/gst_tax/domain/repository/gst_repo.dart';

class FetchGstListUseCase implements UseCase<MasterModel, NoParams> {
  final GstRepo gstRepo;

  FetchGstListUseCase({required this.gstRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams) {
    return gstRepo.fetchGstList();
  }
}
