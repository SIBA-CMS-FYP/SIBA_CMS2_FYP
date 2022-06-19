import 'package:flutter/material.dart';

class NewsActivity extends StatelessWidget {
  const NewsActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Text(
        "News pagese",
        textScaleFactor: 2,
      )),
    );
  }
}
