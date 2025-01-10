import 'dart:convert';

import 'package:vir/features/category/domain/entities/category_data.dart';

// Response model
class MasterResponse {
  final String status;
  final String message;
  final List<MasterData> data;

  MasterResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  // Convert JSON to CategoryResponse object

}

// Category model

