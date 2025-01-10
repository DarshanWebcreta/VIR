import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/dashboard/domain/repository/dashboard_repo.dart';

class MonthWiseQuoteDownloadUseCase implements UseCase<CommonModel, MonthWiseQuoteDownloadParams> {
  final DashboardRepo quoteRepo;

  MonthWiseQuoteDownloadUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, CommonModel>> call(MonthWiseQuoteDownloadParams params) {
    return quoteRepo.monthWiseQuoteDownload(params.body);
  }
}

class MonthWiseQuoteDownloadParams {
  final String body;

  MonthWiseQuoteDownloadParams({required this.body});
}
