import 'package:vir/data/api_service.dart';
import 'package:vir/features/quote/data/model/quote_model.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/features/quote/data/model/quote_view_model.dart';

abstract interface class QuoteRemoteRepo {
  Future<QuoteModel> fetchQuoteList();
  Future<CommonModel> addQuote({required dynamic data});
  Future<CommonModel> updateQuote({required int id, required dynamic data});
  Future<CommonModel> deleteQuote({required int id});
  Future<CommonModel> sendMail({required int id});
  Future<QuoteViewModel> quoteView({required int id});
}

class QuoteImplRemoteRepo implements QuoteRemoteRepo {
  final ApiService apiService;

  QuoteImplRemoteRepo({required this.apiService});

  @override
  Future<QuoteModel> fetchQuoteList() {
    return apiService.quoteList();
  }

  @override
  Future<CommonModel> addQuote({required dynamic data}) {
    return apiService.addQuote(data);
  }

  @override
  Future<CommonModel> updateQuote({required int id, required dynamic data}) {
    return apiService.updateQuote(id, data);
  }

  @override
  Future<CommonModel> deleteQuote({required int id}) {
    return apiService.deleteQuote(id);
  }

  @override
  Future<CommonModel> sendMail({required int id}) {
    return apiService.sendMail(id);
  }

  @override
  Future<QuoteViewModel> quoteView({required int id}) {
    return apiService.viewQuote(id);

  }
}
