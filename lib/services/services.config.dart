// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:upt_test/data/models/user_model/user_model.dart' as _i10;
import 'package:upt_test/pages/login_page/login_page_store.dart' as _i4;
import 'package:upt_test/pages/profile_page/profile_page_store.dart' as _i8;
import 'package:upt_test/pages/registration_page/registration_page_store.dart'
    as _i5;
import 'package:upt_test/pages/settings_page/settings_page_store.dart' as _i9;
import 'package:upt_test/pages/trainers_page/trainers_page_store.dart' as _i6;
import 'package:upt_test/repositories/user_repository/user_repository.dart'
    as _i11;
import 'package:upt_test/services/auth_service/auth_service.dart' as _i3;
import 'package:upt_test/services/firestore_service/firestore_service.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthService>(() => _i3.AuthService());
    gh.lazySingleton<_i4.LoginPageStore>(() => _i4.LoginPageStore());
    gh.lazySingleton<_i5.RegistrationPageStore>(
        () => _i5.RegistrationPageStore());
    gh.lazySingleton<_i6.TrainersPageStore>(() => _i6.TrainersPageStore());
    gh.lazySingleton<_i7.FirestoreService>(() => _i7.FirestoreService());
    gh.lazySingleton<_i8.ProfilePageStore>(
        () => _i8.ProfilePageStore(gh<String>()));
    gh.lazySingleton<_i9.SettingsPageStore>(
        () => _i9.SettingsPageStore(gh<_i10.UserModel>()));
    gh.lazySingleton<_i11.UserRepository>(
        () => _i11.UserRepository(gh<_i7.FirestoreService>()));
    return this;
  }
}
