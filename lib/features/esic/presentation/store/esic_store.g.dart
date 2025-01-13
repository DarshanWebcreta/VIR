// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esic_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EsicStore on _EsicStore, Store {
  late final _$esicListAtom =
      Atom(name: '_EsicStore.esicList', context: context);

  @override
  List<MasterData> get esicList {
    _$esicListAtom.reportRead();
    return super.esicList;
  }

  @override
  set esicList(List<MasterData> value) {
    _$esicListAtom.reportWrite(value, super.esicList, () {
      super.esicList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_EsicStore.isLoading', context: context);

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

  late final _$fetchEsicListAsyncAction =
      AsyncAction('_EsicStore.fetchEsicList', context: context);

  @override
  Future<void> fetchEsicList() {
    return _$fetchEsicListAsyncAction.run(() => super.fetchEsicList());
  }

  late final _$addEsicAsyncAction =
      AsyncAction('_EsicStore.addEsic', context: context);

  @override
  Future<void> addEsic(dynamic request) {
    return _$addEsicAsyncAction.run(() => super.addEsic(request));
  }

  @override
  String toString() {
    return '''
esicList: ${esicList},
isLoading: ${isLoading}
    ''';
  }
}
