import 'package:vir/features/quote/domain/entities/quote_data.dart';

class QuoteListResponse {
  final String status;
  final String message;
  final List<QuoteData> data;

  QuoteListResponse({
    required this.status,
    required this.message,
    required this.data,
  });


}


