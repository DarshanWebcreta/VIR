// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on _CategoryStore, Store {
  late final _$categoryListAtom =
      Atom(name: '_CategoryStore.categoryList', context: context);

  @override
  List<MasterData> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<MasterData> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CategoryStore.isLoading', context: context);

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

  late final _$addCategoryAsyncAction =
      AsyncAction('_CategoryStore.addCategory', context: context);

  @override
  Future<void> addCategory(dynamic request) {
    return _$addCategoryAsyncAction.run(() => super.addCategory(request));
  }

  late final _$getCategoryListAsyncAction =
      AsyncAction('_CategoryStore.getCategoryList', context: context);

  @override
  Future<void> getCategoryList() {
    return _$getCategoryListAsyncAction.run(() => super.getCategoryList());
  }

  late final _$updateCategoryAsyncAction =
      AsyncAction('_CategoryStore.updateCategory', context: context);

  @override
  Future<void> updateCategory(int id, dynamic request) {
    return _$updateCategoryAsyncAction
        .run(() => super.updateCategory(id, request));
  }

  late final _$deleteCategoryAsyncAction =
      AsyncAction('_CategoryStore.deleteCategory', context: context);

  @override
  Future<void> deleteCategory(int id) {
    return _$deleteCategoryAsyncAction.run(() => super.deleteCategory(id));
  }

  @override
  String toString() {
    return '''
categoryList: ${categoryList},
isLoading: ${isLoading}
    ''';
  }
}
