// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_quote_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNewQuoteStore on AddNewQuote, Store {
  late final _$tabFirstAtom =
      Atom(name: 'AddNewQuote.tabFirst', context: context);

  @override
  int get tabFirst {
    _$tabFirstAtom.reportRead();
    return super.tabFirst;
  }

  @override
  set tabFirst(int value) {
    _$tabFirstAtom.reportWrite(value, super.tabFirst, () {
      super.tabFirst = value;
    });
  }

  late final _$companyAddAtom =
      Atom(name: 'AddNewQuote.companyAdd', context: context);

  @override
  bool get companyAdd {
    _$companyAddAtom.reportRead();
    return super.companyAdd;
  }

  @override
  set companyAdd(bool value) {
    _$companyAddAtom.reportWrite(value, super.companyAdd, () {
      super.companyAdd = value;
    });
  }

  late final _$subjectAddAtom =
      Atom(name: 'AddNewQuote.subjectAdd', context: context);

  @override
  bool get subjectAdd {
    _$subjectAddAtom.reportRead();
    return super.subjectAdd;
  }

  @override
  set subjectAdd(bool value) {
    _$subjectAddAtom.reportWrite(value, super.subjectAdd, () {
      super.subjectAdd = value;
    });
  }

  late final _$AddNewQuoteActionController =
      ActionController(name: 'AddNewQuote', context: context);

  @override
  void changeTab(int index) {
    final _$actionInfo = _$AddNewQuoteActionController.startAction(
        name: 'AddNewQuote.changeTab');
    try {
      return super.changeTab(index);
    } finally {
      _$AddNewQuoteActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCompany() {
    final _$actionInfo = _$AddNewQuoteActionController.startAction(
        name: 'AddNewQuote.addCompany');
    try {
      return super.addCompany();
    } finally {
      _$AddNewQuoteActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSubject() {
    final _$actionInfo = _$AddNewQuoteActionController.startAction(
        name: 'AddNewQuote.addSubject');
    try {
      return super.addSubject();
    } finally {
      _$AddNewQuoteActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabFirst: ${tabFirst},
companyAdd: ${companyAdd},
subjectAdd: ${subjectAdd}
    ''';
  }
}
