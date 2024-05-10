// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsPageStore on SettingsPageStoreBase, Store {
  late final _$countryAtom =
      Atom(name: 'SettingsPageStoreBase.country', context: context);

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  late final _$scheduleAtom =
      Atom(name: 'SettingsPageStoreBase.schedule', context: context);

  @override
  String get schedule {
    _$scheduleAtom.reportRead();
    return super.schedule;
  }

  @override
  set schedule(String value) {
    _$scheduleAtom.reportWrite(value, super.schedule, () {
      super.schedule = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'SettingsPageStoreBase.error', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'SettingsPageStoreBase.isLoading', context: context);

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

  late final _$saveAsyncAction =
      AsyncAction('SettingsPageStoreBase.save', context: context);

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$uploadPfpAsyncAction =
      AsyncAction('SettingsPageStoreBase.uploadPfp', context: context);

  @override
  Future<dynamic> uploadPfp() {
    return _$uploadPfpAsyncAction.run(() => super.uploadPfp());
  }

  late final _$SettingsPageStoreBaseActionController =
      ActionController(name: 'SettingsPageStoreBase', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$SettingsPageStoreBaseActionController.startAction(
        name: 'SettingsPageStoreBase.init');
    try {
      return super.init();
    } finally {
      _$SettingsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
country: ${country},
schedule: ${schedule},
error: ${error},
isLoading: ${isLoading}
    ''';
  }
}
