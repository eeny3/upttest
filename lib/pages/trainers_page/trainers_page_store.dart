import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';
import 'package:upt_test/repositories/user_repository/user_repository.dart';

part 'trainers_page_store.g.dart';

@lazySingleton
class TrainersPageStore = TrainersPageStoreBase
    with _$TrainersPageStore;

abstract class TrainersPageStoreBase with Store {
  final UserRepository userRepository = GetIt.I();

  @observable
  bool isLoading = false;

  @observable
  List<UserModel> trainers = [];

  TrainersPageStoreBase();

  @action
  getTrainers() async {
    isLoading = true;
    trainers = await userRepository.getUsers();
    isLoading = false;
  }
}
