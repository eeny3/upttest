import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upt_test/pages/profile_page/profile_page_store.dart';
import 'package:upt_test/routing/app_router.dart';
import 'package:upt_test/widgets/profile_avatar.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  final String userId;

  const ProfilePage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfilePageStore store;

  @override
  void initState() {
    store = ProfilePageStore(widget.userId);
    store.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (context) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (store.isUploading) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).colorScheme.primary,
                    highlightColor: Colors.white,
                    child: const Icon(
                      Icons.file_upload,
                      size: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    store.uploadingMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            );
          }
          if (store.user == null) {
            return Center(
              child: Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProfileAvatar(
                            url: store.user!.profilePic,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store.user!.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                store.user!.country ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          store.isUpdatePermitted
                              ? IconButton(
                                  onPressed: () async {
                                    var result = await context.router.push(
                                      SettingsRoute(
                                        user: store.user!,
                                      ),
                                    );
                                    await store.getProfile();
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                  ),
                                )
                              : const SizedBox(),
                          store.isUpdatePermitted
                              ? IconButton(
                                  onPressed: () async {
                                    FirebaseAuth.instance.signOut();
                                    context.router.replace(
                                      const LoginRoute(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'График работы: ${store.user!.schedule ?? ''}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Обо мне',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff12151E),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        store.user!.description ?? '',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff12151E),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: store.user!.uploads.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 1.5,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.router.push(
                          FullScreenMediaRoute(
                            media: store.user!.uploads[index],
                          ),
                        );
                      },
                      child: Hero(
                        tag: store.user!.uploads[index].sourceUrl,
                        child: SizedBox(
                          child: Image(
                            image: NetworkImage(
                              store.user!.uploads[index].type == 'video'
                                  ? store.user!.uploads[index].thumbnail
                                  : store.user!.uploads[index].sourceUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: store.isUpdatePermitted
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      store.isVideo = false;
                      store.onImageButtonPressed(
                        ImageSource.gallery,
                        context: context,
                        isMedia: true,
                      );
                    },
                    heroTag: 'media',
                    tooltip: 'Pick Single Media from gallery',
                    child: const Icon(Icons.photo_library),
                  ),
                ),
                if (store.picker.supportsImageSource(ImageSource.camera))
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        store.isVideo = false;
                        store.onImageButtonPressed(ImageSource.camera,
                            context: context);
                      },
                      heroTag: 'image2',
                      tooltip: 'Take a Photo',
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),
                if (store.picker.supportsImageSource(ImageSource.camera))
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        store.isVideo = true;
                        store.onImageButtonPressed(ImageSource.camera,
                            context: context);
                      },
                      heroTag: 'video1',
                      tooltip: 'Take a Video',
                      child: const Icon(Icons.videocam),
                    ),
                  ),
              ],
            )
          : null,
    );
  }
}
