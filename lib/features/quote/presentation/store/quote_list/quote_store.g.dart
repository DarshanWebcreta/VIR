// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuoteStore on _QuoteStore, Store {
  late final _$quotesAtom = Atom(name: '_QuoteStore.quotes', context: context);

  @override
  ObservableList<QuoteData> get quotes {
    _$quotesAtom.reportRead();
    return super.quotes;
  }

  @override
  set quotes(ObservableList<QuoteData> value) {
    _$quotesAtom.reportWrite(value, super.quotes, () {
      super.quotes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_QuoteStore.isLoading', context: context);

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

  late final _$messageAtom =
      Atom(name: '_QuoteStore.message', context: context);

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

  late final _$fetchQuotesAsyncAction =
      AsyncAction('_QuoteStore.fetchQuotes', context: context);

  @override
  Future<void> fetchQuotes() {
    return _$fetchQuotesAsyncAction.run(() => super.fetchQuotes());
  }

  late final _$addQuoteAsyncAction =
      AsyncAction('_QuoteStore.addQuote', context: context);

  @override
  Future<void> addQuote(dynamic request) {
    return _$addQuoteAsyncAction.run(() => super.addQuote(request));
  }

  late final _$updateQuoteAsyncAction =
      AsyncAction('_QuoteStore.updateQuote', context: context);

  @override
  Future<void> updateQuote(int id, dynamic request) {
    return _$updateQuoteAsyncAction.run(() => super.updateQuote(id, request));
  }

  late final _$deleteQuoteAsyncAction =
      AsyncAction('_QuoteStore.deleteQuote', context: context);

  @override
  Future<void> deleteQuote(int id) {
    return _$deleteQuoteAsyncAction.run(() => super.deleteQuote(id));
  }

  late final _$sendMailAsyncAction =
      AsyncAction('_QuoteStore.sendMail', context: context);

  @override
  Future<void> sendMail(int id) {
    return _$sendMailAsyncAction.run(() => super.sendMail(id));
  }

  @override
  String toString() {
    return '''
quotes: ${quotes},
isLoading: ${isLoading},
message: ${message}
    ''';
  }
}
