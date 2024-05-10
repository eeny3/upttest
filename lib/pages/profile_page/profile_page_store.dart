import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path;
import 'package:upt_test/data/models/media_content_model/media_content_model.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';
import 'package:upt_test/repositories/user_repository/user_repository.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'profile_page_store.g.dart';

@lazySingleton
class ProfilePageStore = ProfilePageStoreBase with _$ProfilePageStore;

abstract class ProfilePageStoreBase with Store {
  final UserRepository userRepository = GetIt.I();
  final String userId;

  @observable
  bool isLoading = false;

  @observable
  bool isUploading = false;

  @observable
  String error = '';

  @observable
  UserModel? user;

  bool isUpdatePermitted = false;
  final ImagePicker picker = ImagePicker();
  final double profilePicSize = 51.5;
  bool isVideo = false;
  final String uploadingMessage = 'Uploading media file.\nPlease wait...';

  ProfilePageStoreBase(this.userId);

  @action
  getProfile() async {
    isLoading = true;
    final String currentUserId = FirebaseAuth.instance.currentUser?.email ?? '';
    if(currentUserId == userId) {
      isUpdatePermitted = true;
    } else {
      isUpdatePermitted = false;
    }
    if (userId.isEmpty) {
      error = 'Something went wrong';
    } else {
      user = await userRepository.getUser(userId);
    }
    isLoading = false;
  }


  @action
  uploadMedia(XFile? file) async {
    if (file == null || user == null) return;
    isUploading = true;
    final fileName = path.basename(file.path);
    final destination = 'contents/$fileName';

    String mimeStr = lookupMimeType(fileName) ?? '';
    var fileType = mimeStr.split('/');
    final bool isVideoFile = fileType.contains('video');

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('content/');
      final thumbnailRef = FirebaseStorage.instance
          .ref('thumbnail$destination')
          .child('content/');
      await ref.putFile(
        File(
          file.path,
        ),
      );

      if(isVideoFile) {
        final thumbnail = await VideoThumbnail.thumbnailData(
          video: file.path,
          imageFormat: ImageFormat.JPEG,
        );
        if (thumbnail != null) {
          await thumbnailRef.putData(
            thumbnail,
          );
        }
      } else {
        await thumbnailRef.putFile(
          File(
            file.path,
          ),
        );
      }

      final String newContentUrl = await ref.getDownloadURL();
      final String thumbnailUrl = await thumbnailRef.getDownloadURL();
      final MediaContentModel newContentModel = MediaContentModel.fromJson({
        'type': isVideoFile ? 'video' : 'image',
        'sourceUrl': newContentUrl,
        'thumbnail': thumbnailUrl,
      });
      final List<MediaContentModel> uploads = user!.uploads;
      uploads.add(newContentModel);
      user!.uploads = uploads;
      await userRepository.addUser(user!);
    } catch (e) {
      error = e.toString();
    }

    isUploading = false;
    await getProfile();
  }

  Future<void> onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
    bool isMedia = false,
  }) async {
    if(isUploading) {
      return;
    }
    if (context.mounted) {
      if (isVideo) {
        final XFile? file = await picker.pickVideo(
          source: source,
          maxDuration: const Duration(
            seconds: 20,
          ),
        );
        await uploadMedia(file);
      } else if (isMedia) {
        try {
          final XFile? media = await picker.pickMedia();
          await uploadMedia(media);
        } catch (e) {
          error = e.toString();
        }
      } else {
        try {
          final XFile? pickedFile = await picker.pickImage(
            source: source,
          );
          await uploadMedia(pickedFile);
        } catch (e) {
          error = e.toString();
        }
      }
    }
  }
}
