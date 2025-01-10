import 'package:vir/features/dashboard/domain/entities/counts_data.dart';
import 'package:vir/features/dashboard/domain/entities/dashboard_data.dart';

class DashboardModel extends DashboardData{
  DashboardModel({required super.status, required super.message, required super.data});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: QuotesData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}