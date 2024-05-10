// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationPageStore on RegistrationPageStoreBase, Store {
  late final _$isPasswordVisibleAtom = Atom(
      name: 'RegistrationPageStoreBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'RegistrationPageStoreBase.isLoading', context: context);

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

  late final _$registerAsyncAction =
      AsyncAction('RegistrationPageStoreBase.register', context: context);

  @override
  Future register(
      String email, String password, String name, BuildContext context) {
    return _$registerAsyncAction
        .run(() => super.register(email, password, name, context));
  }

  late final _$RegistrationPageStoreBaseActionController =
      ActionController(name: 'RegistrationPageStoreBase', context: context);

  @override
  void onHidePasswordPressed() {
    final _$actionInfo = _$RegistrationPageStoreBaseActionController
        .startAction(name: 'RegistrationPageStoreBase.onHidePasswordPressed');
    try {
      return super.onHidePasswordPressed();
    } finally {
      _$RegistrationPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible},
isLoading: ${isLoading}
    ''';
  }
}
