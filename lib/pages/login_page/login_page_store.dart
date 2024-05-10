import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:upt_test/routing/app_router.dart';
import 'package:upt_test/services/auth_service/auth_service.dart';

part 'login_page_store.g.dart';

@lazySingleton
class LoginPageStore = LoginPageStoreBase with _$LoginPageStore;

abstract class LoginPageStoreBase with Store {
  final AuthService authService = GetIt.I();

  @observable
  bool isPasswordVisible = false;

  @observable
  bool isLoading = false;

  LoginPageStoreBase();

  @action
  void onHidePasswordPressed() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  login(String email, String password, BuildContext context,) async {

    final message = await AuthService().login(
      email: email,
      password: password,
    );

    if (context.mounted) {
      if (message!.contains('Success')) {
        context.router.replace(
          const BottomNavigationRoute(),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
}
