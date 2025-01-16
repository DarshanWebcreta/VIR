import 'package:fpdart/fpdart.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/quote/data/model/quote_model.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/quote/data/model/quote_view_model.dart';

abstract interface class QuoteRepo {
  Future<Either<Failure, QuoteModel>> fetchQuoteList();
  Future<Either<Failure, CommonModel>> addQuote({required dynamic data});
  Future<Either<Failure, CommonModel>> updateQuote({required int id, required dynamic data});
  Future<Either<Failure, CommonModel>> deleteQuote({required int id});
  Future<Either<Failure, CommonModel>> sendMail({required int id});
  Future<Either<Failure, QuoteViewModel>> viewQuote({required int id});
}
