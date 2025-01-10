
class QuotesData {
  final int quoteCount;


  QuotesData({
    required this.quoteCount,

  });

  factory QuotesData.fromJson(Map<String, dynamic> json) {
    return QuotesData(
      quoteCount: json['quoteCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quoteCount': quoteCount,

    };
  }
}