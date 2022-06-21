import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class course extends StatelessWidget {
  const course ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.lightBlue,
        leading: IconButton(
          onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(
          Icons.arrow_back_ios,

        ),
        ),
      ),
      body: Center(
          child: Text(
        "courses",
        textScaleFactor: 2,
      )),
      
    );
  }
}