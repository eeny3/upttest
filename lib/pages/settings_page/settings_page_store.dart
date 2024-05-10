import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';
import 'package:upt_test/repositories/user_repository/user_repository.dart';
import 'package:path/path.dart' as path;

part 'settings_page_store.g.dart';

@lazySingleton
class SettingsPageStore = SettingsPageStoreBase with _$SettingsPageStore;

abstract class SettingsPageStoreBase with Store {
  final UserRepository userRepository = GetIt.I();
  final UserModel user;
  final ImagePicker _pfpPicker = ImagePicker();
  XFile? pfp;
  final double profilePicSize = 51.5;
  late final TextEditingController aboutMeController;

  @observable
  String country = '';

  @observable
  String schedule = '';

  @observable
  String error = '';

  @observable
  bool isLoading = false;

  SettingsPageStoreBase(
    this.user,
  );

  @action
  init() {
    aboutMeController = TextEditingController(
      text: user.description ?? '',
    );
    country = user.country ?? '';
    schedule = user.schedule ?? '';
  }

  @action
  save() async {
    isLoading = true;

    try {
      user.description = aboutMeController.text;
      user.country = country;
      user.schedule = schedule;
      await userRepository.addUser(user);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
  }

  Future pickPfp(BuildContext context, ImageSource source) async {
    if (context.mounted) {
      try {
        final XFile? pickedFile = await _pfpPicker.pickImage(
          source: source,
          maxWidth: profilePicSize * 1.5,
          maxHeight: profilePicSize * 1.5,
        );
        pfp = pickedFile;
        await uploadPfp();
      } catch (e) {
        error = e.toString();
      }
    }
  }

  @action
  Future uploadPfp() async {
    if(pfp == null) {
      return;
    }
    isLoading = true;

    final fileName = path.basename(pfp!.path);
    final destination = 'files/$fileName';

    try {
      if (user.profilePic != null) {
        await FirebaseStorage.instance.refFromURL(user.profilePic!).delete();
      }
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(
        File(
          pfp!.path,
        ),
      );
      user.profilePic = await ref.getDownloadURL();
      await userRepository.addUser(user);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
  }
}
