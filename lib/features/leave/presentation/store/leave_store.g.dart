// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LeavesStore on _LeavesStore, Store {
  late final _$leaveListAtom =
      Atom(name: '_LeavesStore.leaveList', context: context);

  @override
  List<MasterData> get leaveList {
    _$leaveListAtom.reportRead();
    return super.leaveList;
  }

  @override
  set leaveList(List<MasterData> value) {
    _$leaveListAtom.reportWrite(value, super.leaveList, () {
      super.leaveList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LeavesStore.isLoading', context: context);

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

  late final _$fetchLeavesListAsyncAction =
      AsyncAction('_LeavesStore.fetchLeavesList', context: context);

  @override
  Future<void> fetchLeavesList() {
    return _$fetchLeavesListAsyncAction.run(() => super.fetchLeavesList());
  }

  late final _$addLeavesAsyncAction =
      AsyncAction('_LeavesStore.addLeaves', context: context);

  @override
  Future<void> addLeaves(dynamic request) {
    return _$addLeavesAsyncAction.run(() => super.addLeaves(request));
  }

  @override
  String toString() {
    return '''
leaveList: ${leaveList},
isLoading: ${isLoading}
    ''';
  }
}
