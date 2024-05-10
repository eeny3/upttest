import 'package:injectable/injectable.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';
import 'package:upt_test/services/firestore_service/firestore_service.dart';

@lazySingleton
class UserRepository {
  final FirestoreService _firestoreService;

  UserRepository(this._firestoreService);

  Future<List<UserModel>> getUsers() async {
    final users = await _firestoreService.getUsers();
    return users;
  }

  Future addUser(UserModel user) async {
    await _firestoreService.addUser(user);
  }

  Future<UserModel> getUser(String id) async {
    final userModel = await _firestoreService.getUser(id);
    return userModel;
  }

  Future<UserModel> updateUser(String id) async {
    final userModel = await _firestoreService.getUser(id);
    return userModel;
  }
}
