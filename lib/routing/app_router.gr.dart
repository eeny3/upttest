// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavigationPage(),
      );
    },
    FullScreenMediaRoute.name: (routeData) {
      final args = routeData.argsAs<FullScreenMediaRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FullScreenMediaPage(
          key: args.key,
          media: args.media,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    TrainerProfileRoute.name: (routeData) {
      final args = routeData.argsAs<TrainerProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrainerProfilePage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    TrainersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrainersPage(),
      );
    },
  };
}

/// generated route for
/// [BottomNavigationPage]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FullScreenMediaPage]
class FullScreenMediaRoute extends PageRouteInfo<FullScreenMediaRouteArgs> {
  FullScreenMediaRoute({
    Key? key,
    required MediaContentModel media,
    List<PageRouteInfo>? children,
  }) : super(
          FullScreenMediaRoute.name,
          args: FullScreenMediaRouteArgs(
            key: key,
            media: media,
          ),
          initialChildren: children,
        );

  static const String name = 'FullScreenMediaRoute';

  static const PageInfo<FullScreenMediaRouteArgs> page =
      PageInfo<FullScreenMediaRouteArgs>(name);
}

class FullScreenMediaRouteArgs {
  const FullScreenMediaRouteArgs({
    this.key,
    required this.media,
  });

  final Key? key;

  final MediaContentModel media;

  @override
  String toString() {
    return 'FullScreenMediaRouteArgs{key: $key, media: $media}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    required UserModel user,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final UserModel user;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [TrainerProfilePage]
class TrainerProfileRoute extends PageRouteInfo<TrainerProfileRouteArgs> {
  TrainerProfileRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
          TrainerProfileRoute.name,
          args: TrainerProfileRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'TrainerProfileRoute';

  static const PageInfo<TrainerProfileRouteArgs> page =
      PageInfo<TrainerProfileRouteArgs>(name);
}

class TrainerProfileRouteArgs {
  const TrainerProfileRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'TrainerProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [TrainersPage]
class TrainersRoute extends PageRouteInfo<void> {
  const TrainersRoute({List<PageRouteInfo>? children})
      : super(
          TrainersRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
