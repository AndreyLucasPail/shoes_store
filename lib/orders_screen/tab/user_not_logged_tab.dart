import 'package:flutter/material.dart';

class UserNotLogeedIn extends StatelessWidget {
  const UserNotLogeedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person_off_sharp,
            color: Color.fromARGB(255, 38, 24, 94),
            size: 120,
          ),
        ],
      ),
    );
  }
}