import 'package:flutter/material.dart';

class NevBack extends StatelessWidget {
  const NevBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
