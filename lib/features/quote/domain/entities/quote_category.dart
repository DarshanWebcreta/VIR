import 'package:vir/features/quote/domain/entities/pivot.dart';

class QuoteViewCategory {
  final int id;
  final String name;
  final String status;
  final String createdAt;
  final String updatedAt;
  final CategoryPivot pivot;

  QuoteViewCategory({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory QuoteViewCategory.fromJson(Map<String, dynamic> json) {
    return QuoteViewCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      pivot: CategoryPivot.fromJson(json['pivot']),
    );
  }
}