import 'package:vir/features/company/domain/entities/company_data.dart';
import 'package:vir/features/company/domain/entities/company_response.dart';

class CompanyModel  extends CompanyDetailsResponse{
  CompanyModel({required super.status, required super.message, required super.data});
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((item) => CompanyData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}