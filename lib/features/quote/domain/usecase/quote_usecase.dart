import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/core/usecase/usecase.dart';
import 'package:vir/features/quote/data/model/quote_model.dart';
import 'package:vir/features/quote/data/model/quote_view_model.dart';
import 'package:vir/features/quote/domain/repository/quote_repo.dart';

class FetchQuoteListUseCase implements UseCase<QuoteModel, NoParams> {
  final QuoteRepo quoteRepo;

  FetchQuoteListUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, QuoteModel>> call(NoParams params) {
    return quoteRepo.fetchQuoteList();
  }
}


class AddQuoteUseCase implements UseCase<CommonModel, AddQuoteParams> {
  final QuoteRepo quoteRepo;

  AddQuoteUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, CommonModel>> call(AddQuoteParams params) {
    return quoteRepo.addQuote(data: params.data);
  }
}

class AddQuoteParams {
  final dynamic data;

  AddQuoteParams({required this.data});
}

class UpdateQuoteUseCase implements UseCase<CommonModel, UpdateQuoteParams> {
  final QuoteRepo quoteRepo;

  UpdateQuoteUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, CommonModel>> call(UpdateQuoteParams params) {
    return quoteRepo.updateQuote(id: params.id, data: params.data);
  }
}

class UpdateQuoteParams {
  final int id;
  final dynamic data;

  UpdateQuoteParams({required this.id, required this.data});
}

class DeleteQuoteUseCase implements UseCase<CommonModel, DeleteQuoteParams> {
  final QuoteRepo quoteRepo;

  DeleteQuoteUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, CommonModel>> call(DeleteQuoteParams params) {
    return quoteRepo.deleteQuote(id: params.id);
  }
}

class DeleteQuoteParams {
  final int id;

  DeleteQuoteParams({required this.id});
}
class SendMailUseCase implements UseCase<CommonModel, SendMailParams> {
  final QuoteRepo quoteRepo;

  SendMailUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, CommonModel>> call(SendMailParams params) {
    return quoteRepo.sendMail(id: params.id);
  }
}

class SendMailParams {
  final int id;

  SendMailParams({required this.id});
}
class ViewQuoteUseCase implements UseCase<QuoteViewModel, ViewQuoteParams> {
  final QuoteRepo quoteRepo;

  ViewQuoteUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, QuoteViewModel>> call(ViewQuoteParams params) {
    return quoteRepo.viewQuote(id: params.id);
  }
}

class ViewQuoteParams {
  final int id;

  ViewQuoteParams({required this.id});
}