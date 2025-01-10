// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pf_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PfStore on _PfStore, Store {
  late final _$pfListAtom = Atom(name: '_PfStore.pfList', context: context);

  @override
  List<MasterData> get pfList {
    _$pfListAtom.reportRead();
    return super.pfList;
  }

  @override
  set pfList(List<MasterData> value) {
    _$pfListAtom.reportWrite(value, super.pfList, () {
      super.pfList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PfStore.isLoading', context: context);

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

  late final _$fetchPfListAsyncAction =
      AsyncAction('_PfStore.fetchPfList', context: context);

  @override
  Future<void> fetchPfList() {
    return _$fetchPfListAsyncAction.run(() => super.fetchPfList());
  }

  late final _$addPfAsyncAction =
      AsyncAction('_PfStore.addPf', context: context);

  @override
  Future<void> addPf(dynamic request) {
    return _$addPfAsyncAction.run(() => super.addPf(request));
  }

  @override
  String toString() {
    return '''
pfList: ${pfList},
isLoading: ${isLoading}
    ''';
  }
}
