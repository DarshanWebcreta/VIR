import 'dart:convert';

import 'package:vir/core/common/common_model.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/category/data/model/category_model.dart';

abstract interface class SubjectRemoteRepo {
  Future<MasterModel> subjectList();
  Future<CommonModel> updateSubject(int id, dynamic request);
  Future<CommonModel> deleteSubject(int id);
  Future<CommonModel> addSubject(dynamic request);
}

class SubjectImplRemoteRepo implements SubjectRemoteRepo {
  final ApiService apiService;

  SubjectImplRemoteRepo({required this.apiService});

  @override
  Future<MasterModel> subjectList() {
    return apiService.subjectList();
  }

  @override
  Future<CommonModel> updateSubject(int id, dynamic request) {
    return apiService.updatesubject(id, jsonEncode(request));
  }
  @override
  Future<CommonModel> addSubject(dynamic request) {
    return apiService.addSubject(jsonEncode(request));
  }
  @override
  Future<CommonModel> deleteSubject(int id) {
    return apiService.deleteSubject(id);
  }
}
