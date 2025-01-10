// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TermsStore on _TermsStore, Store {
  late final _$termsListAtom =
      Atom(name: '_TermsStore.termsList', context: context);

  @override
  List<MasterData> get termsList {
    _$termsListAtom.reportRead();
    return super.termsList;
  }

  @override
  set termsList(List<MasterData> value) {
    _$termsListAtom.reportWrite(value, super.termsList, () {
      super.termsList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TermsStore.isLoading', context: context);

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

  late final _$fetchTermListAsyncAction =
      AsyncAction('_TermsStore.fetchTermList', context: context);

  @override
  Future<void> fetchTermList() {
    return _$fetchTermListAsyncAction.run(() => super.fetchTermList());
  }

  late final _$addTermAsyncAction =
      AsyncAction('_TermsStore.addTerm', context: context);

  @override
  Future<void> addTerm(dynamic request) {
    return _$addTermAsyncAction.run(() => super.addTerm(request));
  }

  late final _$updateTermAsyncAction =
      AsyncAction('_TermsStore.updateTerm', context: context);

  @override
  Future<void> updateTerm(int id, dynamic request) {
    return _$updateTermAsyncAction.run(() => super.updateTerm(id, request));
  }

  late final _$deleteTermAsyncAction =
      AsyncAction('_TermsStore.deleteTerm', context: context);

  @override
  Future<void> deleteTerm(int id) {
    return _$deleteTermAsyncAction.run(() => super.deleteTerm(id));
  }

  @override
  String toString() {
    return '''
termsList: ${termsList},
isLoading: ${isLoading}
    ''';
  }
}
