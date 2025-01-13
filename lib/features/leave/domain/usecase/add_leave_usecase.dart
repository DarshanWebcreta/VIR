import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/leave/domain/repository/leave_repo.dart';


class AddLeavesUseCase implements UseCase<CommonModel, AddLeavesParams> {
  final LeavesRepo leavesRepo;

  AddLeavesUseCase({required this.leavesRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddLeavesParams params) {
    return leavesRepo.addLeavesApi(params.request);
  }
}

class AddLeavesParams {
  final dynamic request;

  AddLeavesParams({required this.request});
}
