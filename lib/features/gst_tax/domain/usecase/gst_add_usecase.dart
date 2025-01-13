import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/features/gst_tax/domain/repository/gst_repo.dart';

class AddGstUseCase implements UseCase<CommonModel, AddGstParams> {
  final GstRepo gstRepo;

  AddGstUseCase({required this.gstRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddGstParams params) {
    return gstRepo.addGst(data: params.data);
  }
}

class AddGstParams {
  final dynamic data;

  AddGstParams({required this.data});
}

