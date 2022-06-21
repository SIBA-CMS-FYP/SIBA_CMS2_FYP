import 'package:flutter/material.dart';

class Attendence extends StatelessWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
          child: Text(
        "Attendence",
        textScaleFactor: 2,
      )),
    );
  }
}
