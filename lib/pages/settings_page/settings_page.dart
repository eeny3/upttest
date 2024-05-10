import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:upt_test/data/models/user_model/user_model.dart';
import 'package:upt_test/pages/settings_page/settings_page_store.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  final UserModel user;

  const SettingsPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingsPageStore store;

  @override
  void initState() {
    store = SettingsPageStore(widget.user);
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: GestureDetector(
              onTap: () async {
                await store.save();
                if (context.mounted) {
                  context.router.back();
                }
              },
              child: Text(
                'Сохранить',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 22,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    store.user.profilePic != null
                        ? CircleAvatar(
                            radius: 45,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffF1F5FF),
                              radius: 43,
                              backgroundImage: NetworkImage(
                                store.user.profilePic!,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 45,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: const CircleAvatar(
                              backgroundColor: Color(0xffF1F5FF),
                              radius: 43,
                              backgroundImage: AssetImage(
                                'assets/images/no_avatar.png',
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 150,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ElevatedButton(
                                        child: const Row(
                                          children: [
                                            Icon(Icons.photo),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text('Gallery'),
                                          ],
                                        ),
                                        onPressed: () {
                                          store.pickPfp(
                                            context,
                                            ImageSource.gallery,
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      ElevatedButton(
                                        child: const Row(
                                          children: [
                                            Icon(Icons.camera_alt),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text('Camera'),
                                          ],
                                        ),
                                        onPressed: () {
                                          store.pickPfp(
                                            context,
                                            ImageSource.camera,
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Изменить фотографию профиля',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Обо мне:',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  controller: store.aboutMeController,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Введите описание',
                    hintStyle: const TextStyle(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          bottomSheetHeight: 500,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Поиск',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onSelect: (Country country) =>
                            store.country = country.name,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Страна:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              store.country,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      TimeRange result = await showTimeRangePicker(
                        context: context,
                      );
                      store.schedule =
                          '${result.startTime.hour}:${result.startTime.minute} - ${result.endTime.hour}:${result.endTime.minute}';
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'График работы:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              store.schedule,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
