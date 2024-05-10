import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CloseWidget extends StatelessWidget {
  const CloseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.back();
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
