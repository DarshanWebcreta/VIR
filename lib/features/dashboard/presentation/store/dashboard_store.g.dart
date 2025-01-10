// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardStore on _DashboardStore, Store {
  late final _$dashboardModelAtom =
      Atom(name: '_DashboardStore.dashboardModel', context: context);

  @override
  DashboardModel? get dashboardModel {
    _$dashboardModelAtom.reportRead();
    return super.dashboardModel;
  }

  @override
  set dashboardModel(DashboardModel? value) {
    _$dashboardModelAtom.reportWrite(value, super.dashboardModel, () {
      super.dashboardModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DashboardStore.isLoading', context: context);

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

  late final _$startDateAtom =
      Atom(name: '_DashboardStore.startDate', context: context);

  @override
  String get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(String value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: '_DashboardStore.endDate', context: context);

  @override
  String get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(String value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$callApiAsyncAction =
      AsyncAction('_DashboardStore.callApi', context: context);

  @override
  Future<void> callApi() {
    return _$callApiAsyncAction.run(() => super.callApi());
  }

  @override
  String toString() {
    return '''
dashboardModel: ${dashboardModel},
isLoading: ${isLoading},
startDate: ${startDate},
endDate: ${endDate}
    ''';
  }
}
