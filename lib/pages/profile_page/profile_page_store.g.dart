// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfilePageStore on ProfilePageStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ProfilePageStoreBase.isLoading', context: context);

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

  late final _$isUploadingAtom =
      Atom(name: 'ProfilePageStoreBase.isUploading', context: context);

  @override
  bool get isUploading {
    _$isUploadingAtom.reportRead();
    return super.isUploading;
  }

  @override
  set isUploading(bool value) {
    _$isUploadingAtom.reportWrite(value, super.isUploading, () {
      super.isUploading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'ProfilePageStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$userAtom =
      Atom(name: 'ProfilePageStoreBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$getProfileAsyncAction =
      AsyncAction('ProfilePageStoreBase.getProfile', context: context);

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  late final _$uploadMediaAsyncAction =
      AsyncAction('ProfilePageStoreBase.uploadMedia', context: context);

  @override
  Future uploadMedia(XFile? file) {
    return _$uploadMediaAsyncAction.run(() => super.uploadMedia(file));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isUploading: ${isUploading},
error: ${error},
user: ${user}
    ''';
  }
}
