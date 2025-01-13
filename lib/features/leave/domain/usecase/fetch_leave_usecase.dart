import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/leave/domain/repository/leave_repo.dart';


class LeavesListUseCase implements UseCase<MasterModel, NoParams> {
  final LeavesRepo leavesRepo;

  LeavesListUseCase({required this.leavesRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams) {
    return leavesRepo.leavesListApi();
  }
}
