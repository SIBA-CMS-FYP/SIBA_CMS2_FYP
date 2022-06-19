import 'package:flutter/material.dart';

class NotificationActivity extends StatelessWidget {
  const NotificationActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
          child: Text(
        "Notifivation pagese",
        textScaleFactor: 2,
      )),
    );
  }
}
