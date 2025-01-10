// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubjectStore on _SubjectStore, Store {
  late final _$subjectListAtom =
      Atom(name: '_SubjectStore.subjectList', context: context);

  @override
  List<MasterData> get subjectList {
    _$subjectListAtom.reportRead();
    return super.subjectList;
  }

  @override
  set subjectList(List<MasterData> value) {
    _$subjectListAtom.reportWrite(value, super.subjectList, () {
      super.subjectList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SubjectStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addSubjectAsyncAction =
      AsyncAction('_SubjectStore.addSubject', context: context);

  @override
  Future<void> addSubject(dynamic request) {
    return _$addSubjectAsyncAction.run(() => super.addSubject(request));
  }

  late final _$getSubjectListAsyncAction =
      AsyncAction('_SubjectStore.getSubjectList', context: context);

  @override
  Future<void> getSubjectList() {
    return _$getSubjectListAsyncAction.run(() => super.getSubjectList());
  }

  late final _$updateSubjectAsyncAction =
      AsyncAction('_SubjectStore.updateSubject', context: context);

  @override
  Future<void> updateSubject(int id, dynamic request) {
    return _$updateSubjectAsyncAction
        .run(() => super.updateSubject(id, request));
  }

  late final _$deleteSubjectAsyncAction =
      AsyncAction('_SubjectStore.deleteSubject', context: context);

  @override
  Future<void> deleteSubject(int id) {
    return _$deleteSubjectAsyncAction.run(() => super.deleteSubject(id));
  }

  @override
  String toString() {
    return '''
subjectList: ${subjectList},
isLoading: ${isLoading}
    ''';
  }
}
