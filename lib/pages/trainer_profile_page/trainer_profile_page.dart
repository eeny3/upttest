import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upt_test/pages/profile_page/profile_page.dart';

@RoutePage()
class TrainerProfilePage extends StatefulWidget {
  final String userId;

  const TrainerProfilePage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<TrainerProfilePage> createState() => _TrainerProfilePageState();
}

class _TrainerProfilePageState extends State<TrainerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProfilePage(
        userId: widget.userId,
      ),
    );
  }
}
