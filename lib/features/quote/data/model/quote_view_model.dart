import 'package:vir/features/quote/domain/entities/quote_category.dart';
import 'package:vir/features/quote/domain/entities/view_quote_response.dart';

class QuoteViewModel extends QuoteDetailsResponse{
  QuoteViewModel({required super.status, required super.message, required super.data});
  factory QuoteViewModel.fromJson(Map<String, dynamic> json) {
    return QuoteViewModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: QuoteDetails.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}