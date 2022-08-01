import 'package:flutter/material.dart';

class Details extends StatelessWidget {
String index;
Details(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("here are terms"),
          ),
          body: Center(child: Text(index.toString()),)
    );
  }
}