import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:upt_test/main.dart';
import 'package:upt_test/pages/trainers_page/trainers_page_store.dart';
import 'package:upt_test/routing/app_router.dart';

@RoutePage()
class TrainersPage extends StatefulWidget {
  const TrainersPage({Key? key}) : super(key: key);

  @override
  State<TrainersPage> createState() => _TrainersPageState();
}

class _TrainersPageState extends State<TrainersPage> {
  final TrainersPageStore store = GetIt.I();

  @override
  void initState() {
    store.getTrainers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тренеры'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          32,
          16,
          0,
        ),
        child: Observer(builder: (context) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: store.trainers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.router.push(
                    TrainerProfileRoute(
                      userId: store.trainers[index].id,
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        store.trainers[index].profilePic != null
                            ? CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  store.trainers[index].profilePic!,
                                ),
                              )
                            : const CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  'assets/images/no_avatar.png',
                                ),
                              ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          store.trainers[index].name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
