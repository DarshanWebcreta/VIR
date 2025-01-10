import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/dashboard/data/model/dashboard_count_model.dart';
import 'package:vir/features/dashboard/domain/repository/dashboard_repo.dart';

class DashboardUsecase implements UseCase<DashboardModel, NoParams> {
  final DashboardRepo dashboardRepo;

  DashboardUsecase({required this.dashboardRepo});

  @override
  Future<Either<Failure, DashboardModel>> call(NoParams) {
    return dashboardRepo.dashboardApi();
  }
}
