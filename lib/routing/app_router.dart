import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upt_test/pages/bottom_navigation_page/bottom_navigation_page.dart';
import 'package:upt_test/pages/login_page/login_page.dart';
import 'package:upt_test/pages/trainers_page/trainers_page.dart';
import 'package:upt_test/pages/profile_page/profile_page.dart';
import 'package:upt_test/pages/full_screen_media_page/full_screen_media_page.dart';
import 'package:upt_test/pages/registration_page/registration_page.dart';
import 'package:upt_test/pages/settings_page/settings_page.dart';
import 'package:upt_test/pages/trainer_profile_page/trainer_profile_page.dart';
import 'package:upt_test/data/models/media_content_model/media_content_model.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: FirebaseAuth.instance.currentUser == null ? true : false,
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
        ),
        AutoRoute(
          initial: FirebaseAuth.instance.currentUser == null ? false : true,
          page: BottomNavigationRoute.page,
          children: [
            AutoRoute(
              page: TrainersRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: TrainerProfileRoute.page,
        ),
        AutoRoute(
          page: FullScreenMediaRoute.page,
        ),
        AutoRoute(
          page: SettingsRoute.page,
        ),
      ];
}
