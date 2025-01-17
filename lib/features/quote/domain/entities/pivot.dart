import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

class CategoryPivot {
   int quoteId;
  @observable
   int categoryId;
   TextEditingController wages;
   TextEditingController allowance;
   int applyPercentageForHra;
   int applyPercentageForAgency;
   TextEditingController hraCharge;
   TextEditingController agencyCharge;
   int hra;
   int proFund;
   int esic;
   int bonus;
   int leave;
   String createdAt;
   String updatedAt;

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
      wages: TextEditingController(text: json['wages'] ?? '0.00'), // Default value if null
      allowance: TextEditingController(text: json['allowance'] ?? '0.00'), // Default value if null
      applyPercentageForHra: json['apply_percentage_for_hra'] as int,
      applyPercentageForAgency: json['apply_percentage_for_agency'] as int,
      hraCharge: TextEditingController(text: "${json['hra_charge'] as int}"),
      agencyCharge: TextEditingController(text: "${json['agency_charge'] as int}"),
      hra: json['hra'] as int,
      proFund: json['pro_fund'] as int,
      esic: json['esic'] as int,
      bonus: json['bonus'] as int,
      leave: json['leave'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
   Map<String, dynamic> toJson() {
     return {

       "category_id": categoryId,
       "wages": wages.text, // Extract text from controller
       "allowance": allowance.text, // Extract text from controller
       "apply_percentage_for_hra": applyPercentageForHra,
       "apply_percentage_for_agency": applyPercentageForAgency,
       "hra_charge": hraCharge.text, // Extract text from controller
       "agency_charge": agencyCharge.text, // Extract text from controller
       "hra": hra,
       "pro_fund": proFund,
       "esic": esic,
       "bonus": bonus,
       "leave": leave,
     };
   }
}