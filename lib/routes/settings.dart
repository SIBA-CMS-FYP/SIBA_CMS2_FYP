import 'package:flutter/material.dart';

class CourseWithdraw extends StatefulWidget {
  const CourseWithdraw({Key? key}) : super(key: key);

  @override
  _CourseWithdrawState createState() => _CourseWithdrawState();
}

class _CourseWithdrawState extends State<CourseWithdraw> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Withdraw page"),
      ),
    );
  }
}
