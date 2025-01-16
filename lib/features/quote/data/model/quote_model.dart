import 'package:vir/features/quote/domain/entities/quote_data.dart';
import 'package:vir/features/quote/domain/entities/quote_list_response.dart';

class QuoteModel extends QuoteListResponse{
  QuoteModel({required super.status, required super.message, required super.data});
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      status: json['status'],
      message: json['message'],
      data: List<QuoteData>.from(
        json['data'].map((x) => QuoteData.fromJson(x)),
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}