import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/subject/repository/subject_repo.dart';


class SubjectListUsecase implements UseCase<MasterModel, NoParams> {
  final SubjectRepo subjectRepo;

  SubjectListUsecase({required this.subjectRepo});

  @override
  Future<Either<Failure, MasterModel>> call(NoParams params) {
    return subjectRepo.subjectList();
  }
}
class AddSubjectUsecase implements UseCase<CommonModel, AddSubjectParams> {
  final SubjectRepo subjectRepo;

  AddSubjectUsecase({required this.subjectRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddSubjectParams params) {
    return subjectRepo.addSubject(params.request);
  }
}

class AddSubjectParams {
  final dynamic request;

  AddSubjectParams({required this.request});
}

class UpdateSubjectUsecase implements UseCase<CommonModel, UpdateSubjectParams> {
  final SubjectRepo subjectRepo;

  UpdateSubjectUsecase({required this.subjectRepo});

  @override
  Future<Either<Failure, CommonModel>> call(UpdateSubjectParams params) {
    return subjectRepo.updateSubject(params.id, params.request);
  }
}

class DeleteSubjectUsecase implements UseCase<CommonModel, DeleteSubjectParams> {
  final SubjectRepo subjectRepo;

  DeleteSubjectUsecase({required this.subjectRepo});

  @override
  Future<Either<Failure, CommonModel>> call(DeleteSubjectParams params) {
    return subjectRepo.deleteSubject(params.id);
  }
}

class UpdateSubjectParams {
  final int id;
  final dynamic request;

  UpdateSubjectParams({required this.id, required this.request});
}

class DeleteSubjectParams {
  final int id;

  DeleteSubjectParams({required this.id});
}
