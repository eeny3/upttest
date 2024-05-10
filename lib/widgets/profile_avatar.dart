import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? url;

  const ProfileAvatar({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url != null
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: CircleAvatar(
              backgroundColor: const Color(0xffF1F5FF),
              radius: 34,
              backgroundImage: NetworkImage(
                url!,
              ),
            ),
          )
        : CircleAvatar(
            radius: 36,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const CircleAvatar(
              backgroundColor: Color(0xffF1F5FF),
              radius: 34,
              backgroundImage: AssetImage(
                'assets/images/no_avatar.png',
              ),
            ),
          );
  }
}
