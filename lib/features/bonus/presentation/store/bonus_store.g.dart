// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BonusStore on _BonusStore, Store {
  late final _$bonusListAtom =
      Atom(name: '_BonusStore.bonusList', context: context);

  @override
  List<MasterData> get bonusList {
    _$bonusListAtom.reportRead();
    return super.bonusList;
  }

  @override
  set bonusList(List<MasterData> value) {
    _$bonusListAtom.reportWrite(value, super.bonusList, () {
      super.bonusList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_BonusStore.isLoading', context: context);

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

  late final _$fetchBonusListAsyncAction =
      AsyncAction('_BonusStore.fetchBonusList', context: context);

  @override
  Future<void> fetchBonusList() {
    return _$fetchBonusListAsyncAction.run(() => super.fetchBonusList());
  }

  late final _$addBonusAsyncAction =
      AsyncAction('_BonusStore.addBonus', context: context);

  @override
  Future<void> addBonus(dynamic request) {
    return _$addBonusAsyncAction.run(() => super.addBonus(request));
  }

  @override
  String toString() {
    return '''
bonusList: ${bonusList},
isLoading: ${isLoading}
    ''';
  }
}
