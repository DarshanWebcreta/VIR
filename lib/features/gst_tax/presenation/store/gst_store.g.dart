// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gst_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GstStore on _GstStore, Store {
  late final _$gstListAtom = Atom(name: '_GstStore.gstList', context: context);

  @override
  List<MasterData> get gstList {
    _$gstListAtom.reportRead();
    return super.gstList;
  }

  @override
  set gstList(List<MasterData> value) {
    _$gstListAtom.reportWrite(value, super.gstList, () {
      super.gstList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GstStore.isLoading', context: context);

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

  late final _$messageAtom = Atom(name: '_GstStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$fetchGstListAsyncAction =
      AsyncAction('_GstStore.fetchGstList', context: context);

  @override
  Future<void> fetchGstList() {
    return _$fetchGstListAsyncAction.run(() => super.fetchGstList());
  }

  late final _$addGstAsyncAction =
      AsyncAction('_GstStore.addGst', context: context);

  @override
  Future<void> addGst(dynamic request) {
    return _$addGstAsyncAction.run(() => super.addGst(request));
  }

  @override
  String toString() {
    return '''
gstList: ${gstList},
isLoading: ${isLoading},
message: ${message}
    ''';
  }
}
