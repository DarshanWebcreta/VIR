// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$profileModelAtom =
      Atom(name: '_ProfileStore.profileModel', context: context);

  @override
  ProfileModel? get profileModel {
    _$profileModelAtom.reportRead();
    return super.profileModel;
  }

  @override
  set profileModel(ProfileModel? value) {
    _$profileModelAtom.reportWrite(value, super.profileModel, () {
      super.profileModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileStore.isLoading', context: context);

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
      Atom(name: '_ProfileStore.message', context: context);

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

  late final _$fetchProfileAsyncAction =
      AsyncAction('_ProfileStore.fetchProfile', context: context);

  @override
  Future<void> fetchProfile() {
    return _$fetchProfileAsyncAction.run(() => super.fetchProfile());
  }

  late final _$updateProfileAsyncAction =
      AsyncAction('_ProfileStore.updateProfile', context: context);

  @override
  Future<void> updateProfile(dynamic request) {
    return _$updateProfileAsyncAction.run(() => super.updateProfile(request));
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_ProfileStore.changePassword', context: context);

  @override
  Future<void> changePassword(dynamic request) {
    return _$changePasswordAsyncAction.run(() => super.changePassword(request));
  }

  @override
  String toString() {
    return '''
profileModel: ${profileModel},
isLoading: ${isLoading},
message: ${message}
    ''';
  }
}
