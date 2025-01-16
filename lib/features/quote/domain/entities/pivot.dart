class CategoryPivot {
  final int quoteId;
  final int categoryId;
  final String wages;
  final String allowance;
  final int applyPercentageForHra;
  final int applyPercentageForAgency;
  final int hraCharge;
  final int agencyCharge;
  final int hra;
  final int proFund;
  final int esic;
  final int bonus;
  final int leave;
  final String createdAt;
  final String updatedAt;

  CategoryPivot({
    required this.quoteId,
    required this.categoryId,
    required this.wages,
    required this.allowance,
    required this.applyPercentageForHra,
    required this.applyPercentageForAgency,
    required this.hraCharge,
    required this.agencyCharge,
    required this.hra,
    required this.proFund,
    required this.esic,
    required this.bonus,
    required this.leave,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryPivot.fromJson(Map<String, dynamic> json) {
    return CategoryPivot(
      quoteId: json['quote_id'] as int,
      categoryId: json['category_id'] as int,
      wages: json['wages'] ?? '0.00', // Default value if null
      allowance: json['allowance'] ?? '0.00', // Default value if null
      applyPercentageForHra: json['apply_percentage_for_hra'] as int,
      applyPercentageForAgency: json['apply_percentage_for_agency'] as int,
      hraCharge: json['hra_charge'] as int,
      agencyCharge: json['agency_charge'] as int,
      hra: json['hra'] as int,
      proFund: json['pro_fund'] as int,
      esic: json['esic'] as int,
      bonus: json['bonus'] as int,
      leave: json['leave'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}