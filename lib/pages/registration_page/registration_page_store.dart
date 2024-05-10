import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';
import 'package:upt_test/repositories/user_repository/user_repository.dart';
import 'package:upt_test/routing/app_router.dart';
import 'package:upt_test/services/auth_service/auth_service.dart';

part 'registration_page_store.g.dart';

@lazySingleton
class RegistrationPageStore = RegistrationPageStoreBase
    with _$RegistrationPageStore;

abstract class RegistrationPageStoreBase with Store {
  final AuthService authService = GetIt.I();
  final UserRepository userRepository = GetIt.I();

  @observable
  bool isPasswordVisible = false;

  @observable
  bool isLoading = false;

  RegistrationPageStoreBase();

  @action
  void onHidePasswordPressed() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  register(
    String email,
    String password,
    String name,
    BuildContext context,
  ) async {
    isLoading = true;

    await AuthService()
        .registration(
      email: email,
      password: password,
    )
        .then((message) async {
      if (message!.contains('Success')) {
        final UserModel newUser = UserModel.fromJson({
          'id': email,
          'name': name,
          'uploads': [],
        });
        await userRepository.addUser(newUser).then((result) {
          isLoading = false;
          context.router.replace(
            const BottomNavigationRoute(),
          );
        });
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      }
    });
  }
}
