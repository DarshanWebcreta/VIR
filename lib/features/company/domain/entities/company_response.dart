import 'package:vir/features/company/domain/entities/company_data.dart';

class CompanyDetailsResponse {
  final String status;
  final String message;
  final List<CompanyData> data;

  CompanyDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });


}


