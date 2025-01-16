import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/exception.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/quote/data/model/quote_model.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/quote/data/model/quote_view_model.dart';
import 'package:vir/features/quote/data/repositories/quote_remote_repo.dart';
import 'package:vir/features/quote/domain/repository/quote_repo.dart';

class QuoteImplRepo implements QuoteRepo {
  final QuoteRemoteRepo quoteRemoteRepo;

  QuoteImplRepo({required this.quoteRemoteRepo});

  @override
  Future<Either<Failure, QuoteModel>> fetchQuoteList() async {
    try {
      final response = await quoteRemoteRepo.fetchQuoteList();
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> addQuote({required dynamic data}) async {
    try {
      final response = await quoteRemoteRepo.addQuote(data: data);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> updateQuote({required int id, required dynamic data}) async {
    try {
      final response = await quoteRemoteRepo.updateQuote(id: id, data: data);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> deleteQuote({required int id}) async {
    try {
      final response = await quoteRemoteRepo.deleteQuote(id: id);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, CommonModel>> sendMail({required int id}) async {
    try {
      final response = await quoteRemoteRepo.sendMail(id: id);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }

  @override
  Future<Either<Failure, QuoteViewModel>> viewQuote({required int id}) async{
    try {
      final response = await quoteRemoteRepo.quoteView(id: id);
      return right(response);
    } on DioException catch (e) {
      return left(Failure(HandleExeption.handleError(e)));
    }
  }
}
