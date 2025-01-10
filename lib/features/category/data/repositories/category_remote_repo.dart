import 'dart:convert';

import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';

abstract interface class CategoryRemoteRepo {
  Future<MasterModel> categoryList();
  Future<CommonModel> updateCategory(int id, dynamic request);
  Future<CommonModel> deleteCategory(int id);
  Future<CommonModel> addCategory(dynamic request);
}

class CategoryImplRemoteRepo implements CategoryRemoteRepo {
  final ApiService apiService;

  CategoryImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> categoryList() {
    return apiService.categoryList();
  }

  @override
  Future<CommonModel> updateCategory(int id, dynamic request) {
    return apiService.updateCategory(id, jsonEncode(request));
  }
  @override
  Future<CommonModel> addCategory(dynamic request) {
    return apiService.addCategory(jsonEncode(request));
  }
  @override
  Future<CommonModel> deleteCategory(int id) {
    return apiService.deleteCategory(id);
  }
}
