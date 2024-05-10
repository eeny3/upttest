import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';

@lazySingleton
class FirestoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<UserModel>> getUsers() async {
    final String userId = FirebaseAuth.instance.currentUser?.email ?? '';
    const String collectionName = 'Users';
    var users = <UserModel>[];
    await db.collection(collectionName).get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        final model = UserModel.fromJson(element.data());
        if (model.id != userId) {
          users.add(
            model,
          );
        }
      }
    });
    return users;
  }

  Future addUser(UserModel user) async {
    const String collectionName = 'Users';
    await db.collection(collectionName).doc(user.id).set(user.toJson());
  }

  Future<UserModel> getUser(String id) async {
    const String collectionName = 'Users';

    final docRef = db.collection(collectionName).doc(id);
    final docSnapshot = await docRef.get();
    final data = docSnapshot.data() as Map<String, dynamic>;
    final userModel = UserModel.fromJson(data);
    return userModel;
  }
}
