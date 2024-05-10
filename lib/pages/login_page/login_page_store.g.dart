// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageStore on LoginPageStoreBase, Store {
  late final _$isPasswordVisibleAtom =
      Atom(name: 'LoginPageStoreBase.isPasswordVisible', context: context);

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
      Atom(name: 'LoginPageStoreBase.isLoading', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('LoginPageStoreBase.login', context: context);

  @override
  Future login(String email, String password, BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(email, password, context));
  }

  late final _$LoginPageStoreBaseActionController =
      ActionController(name: 'LoginPageStoreBase', context: context);

  @override
  void onHidePasswordPressed() {
    final _$actionInfo = _$LoginPageStoreBaseActionController.startAction(
        name: 'LoginPageStoreBase.onHidePasswordPressed');
    try {
      return super.onHidePasswordPressed();
    } finally {
      _$LoginPageStoreBaseActionController.endAction(_$actionInfo);
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
