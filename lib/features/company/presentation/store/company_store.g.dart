// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanyStore on _CompanyStore, Store {
  late final _$companyListAtom =
      Atom(name: '_CompanyStore.companyList', context: context);

  @override
  List<CompanyData> get companyList {
    _$companyListAtom.reportRead();
    return super.companyList;
  }

  @override
  set companyList(List<CompanyData> value) {
    _$companyListAtom.reportWrite(value, super.companyList, () {
      super.companyList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CompanyStore.isLoading', context: context);

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
      Atom(name: '_CompanyStore.startDate', context: context);

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

  late final _$selectedCompanyNameAtom =
      Atom(name: '_CompanyStore.selectedCompanyName', context: context);

  @override
  String get selectedCompanyName {
    _$selectedCompanyNameAtom.reportRead();
    return super.selectedCompanyName;
  }

  @override
  set selectedCompanyName(String value) {
    _$selectedCompanyNameAtom.reportWrite(value, super.selectedCompanyName, () {
      super.selectedCompanyName = value;
    });
  }

  late final _$selectedCompanyIdAtom =
      Atom(name: '_CompanyStore.selectedCompanyId', context: context);

  @override
  int get selectedCompanyId {
    _$selectedCompanyIdAtom.reportRead();
    return super.selectedCompanyId;
  }

  @override
  set selectedCompanyId(int value) {
    _$selectedCompanyIdAtom.reportWrite(value, super.selectedCompanyId, () {
      super.selectedCompanyId = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: '_CompanyStore.endDate', context: context);

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
      AsyncAction('_CompanyStore.callApi', context: context);

  @override
  Future<void> callApi() {
    return _$callApiAsyncAction.run(() => super.callApi());
  }

  late final _$addUpdateCompanyAsyncAction =
      AsyncAction('_CompanyStore.addUpdateCompany', context: context);

  @override
  Future<void> addUpdateCompany(
      {int? id,
      required String companyName,
      required String pfNo,
      required String regNo,
      required String serTax,
      required String gstNo,
      required String profTax,
      required String panNo,
      required String gujPoliceNo,
      required String rjPoliceNo,
      required bool update,
      File? logo}) {
    return _$addUpdateCompanyAsyncAction.run(() => super.addUpdateCompany(
        id: id,
        companyName: companyName,
        pfNo: pfNo,
        regNo: regNo,
        serTax: serTax,
        gstNo: gstNo,
        profTax: profTax,
        panNo: panNo,
        gujPoliceNo: gujPoliceNo,
        rjPoliceNo: rjPoliceNo,
        update: update,
        logo: logo));
  }

  late final _$deleteCompanyAsyncAction =
      AsyncAction('_CompanyStore.deleteCompany', context: context);

  @override
  Future<void> deleteCompany(int id) {
    return _$deleteCompanyAsyncAction.run(() => super.deleteCompany(id));
  }

  @override
  String toString() {
    return '''
companyList: ${companyList},
isLoading: ${isLoading},
startDate: ${startDate},
selectedCompanyName: ${selectedCompanyName},
selectedCompanyId: ${selectedCompanyId},
endDate: ${endDate}
    ''';
  }
}
