
import 'package:mobx/mobx.dart';
import 'package:vir/features/quote/domain/entities/quote_category.dart';

class QuoteDetailsResponse {
  final String status;
  final String message;
  final QuoteDetails data;

  QuoteDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });


}
class QuoteDetails {
  final int id;
  final int userId;
  final int companyId;
   String? companyName;
   String? subjectName;

   int subjectId;
  final String name;
  final String phoneNo;
  final String address;
  final String address1;
  final String city;
  final String district;
  final String pincode;
  final String gstNo;
  final String? email;
  final String status;
  final String rateHours;
  final int applyCgst;
  final int applySgst;
  final int applyIgst;
  @observable
  final List<String> terms;
  final int sendEmail;
  final String createdAt;
  final String updatedAt;
  final List<QuoteViewCategory> categories;

  QuoteDetails({
    required this.id,
    required this.userId,
    required this.companyId,
    required this.subjectId,
    required this.name,
     this.subjectName,
     this.companyName,
    required this.phoneNo,
    required this.address,
    required this.address1,
    required this.city,
    required this.district,
    required this.pincode,
    required this.gstNo,
    this.email,
    required this.status,
    required this.rateHours,
    required this.applyCgst,
    required this.applySgst,
    required this.applyIgst,
    required this.terms,
    required this.sendEmail,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
  });

  factory QuoteDetails.fromJson(Map<String, dynamic> json) {
    return QuoteDetails(
      id: json['id'] ,
      userId: json['user_id'] ,

      companyId: json['company_id'] ,
      subjectId: json['subject_id']??0 ,
      name:json['name'] ??'',
      phoneNo: json['phone_no'] ??'' ,
      address: json['address']??'',
      address1: json['address1']??'',
      city:  json['city']??'' ,
      district:  json['district']??'',
      pincode:  json['pincode']??'' ,
      gstNo:json['gst_no'] ??'' ,
      email: json['email'] ??'' ,
      status: json['status']??'' ,
      rateHours: json['rate_hours'] ??'',
      applyCgst: json['apply_cgst']??'' ,
      applySgst: json['apply_sgst']??'' ,
      applyIgst: json['apply_igst'] ??'',
      terms: List<String>.from(json['terms'] ?? []),
      sendEmail: json['send_email'] ,
      createdAt: json['created_at'] ,
      updatedAt: json['updated_at'] ,
      categories: (json['categories'] as List)
          .map((e) => QuoteViewCategory.fromJson(e))
          .toList(),
    );
  }
}




