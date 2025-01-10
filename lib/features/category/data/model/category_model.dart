import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/category/domain/entities/category_response.dart';

class MasterModel extends MasterResponse{
  MasterModel({required super.status, required super.message, required super.data});
  factory MasterModel.fromJson(Map<String, dynamic> json) {
    return MasterModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((categoryJson) => MasterData.fromJson(categoryJson))
          .toList(),
    );
  }

  // Convert CategoryResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((category) => category.toJson()).toList(),
    };
  }
}