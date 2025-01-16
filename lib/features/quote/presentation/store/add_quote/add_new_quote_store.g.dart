// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_quote_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNewQuoteStore on AddNewQuote, Store {
  late final _$isLoadingAtom =
      Atom(name: 'AddNewQuote.isLoading', context: context);

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

  late final _$quoteViewModelAtom =
      Atom(name: 'AddNewQuote.quoteViewModel', context: context);

  @override
  QuoteViewModel? get quoteViewModel {
    _$quoteViewModelAtom.reportRead();
    return super.quoteViewModel;
  }

  @override
  set quoteViewModel(QuoteViewModel? value) {
    _$quoteViewModelAtom.reportWrite(value, super.quoteViewModel, () {
      super.quoteViewModel = value;
    });
  }

  late final _$setDropDownValuesAsyncAction =
      AsyncAction('AddNewQuote.setDropDownValues', context: context);

  @override
  Future<void> setDropDownValues({required QuoteDetails quote}) {
    return _$setDropDownValuesAsyncAction
        .run(() => super.setDropDownValues(quote: quote));
  }

  late final _$changeSubjectAsyncAction =
      AsyncAction('AddNewQuote.changeSubject', context: context);

  @override
  Future<void> changeSubject(
      {required int id,
      required String subjectName,
      required QuoteDetails data}) {
    return _$changeSubjectAsyncAction.run(() =>
        super.changeSubject(id: id, subjectName: subjectName, data: data));
  }

  late final _$fetchQuoteAsyncAction =
      AsyncAction('AddNewQuote.fetchQuote', context: context);

  @override
  Future<void> fetchQuote({required int id}) {
    return _$fetchQuoteAsyncAction.run(() => super.fetchQuote(id: id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
quoteViewModel: ${quoteViewModel}
    ''';
  }
}
