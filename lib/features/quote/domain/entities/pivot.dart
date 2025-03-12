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
   TextEditingController reliverCharge;
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
    required this.reliverCharge,
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
      quoteId: json['quote_id'] ,
      reliverCharge: TextEditingController(text: json['reliver_charges']??'') ,
      categoryId: json['category_id']??0 ,
      wages: TextEditingController(text: json['wages'] ?? '0.00'), // Default value if null
      allowance: TextEditingController(text: json['allowance'] ?? '0.00'), // Default value if null
      applyPercentageForHra: json['apply_percentage_for_hra']??0 ,
      applyPercentageForAgency: json['apply_percentage_for_agency']??0 ,
      hraCharge: TextEditingController(text: "${json['hra_charge']??'' }"),
      agencyCharge: TextEditingController(text: "${json['agency_charge']??'' }"),
      hra: json['hra']??0 ,
      proFund: json['pro_fund']??0 ,
      esic: json['esic']??0 ,
      bonus: json['bonus']??0 ,
      leave: json['leave']??0 ,
      createdAt: json['created_at'] ,
      updatedAt: json['updated_at'] ,
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