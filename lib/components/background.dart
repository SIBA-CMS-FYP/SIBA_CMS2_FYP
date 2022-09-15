import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 1,
            right: 0,
            child: Image.asset("assets/images/top1.png",
                width: size.width, fit: BoxFit.fitWidth),
          ),
          Positioned(
            top: -3,
            right: 0,
            child: Image.asset("assets/images/top2.png",
                width: size.width, fit: BoxFit.fitWidth),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset("assets/images/iba_logo.png",
                width: size.width * 0.30),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom1.png",
                width: size.width, fit: BoxFit.fitWidth),
          ),
          Positioned(
            bottom: 7,
            right: 0,
            child: Image.asset("assets/images/bottom2.png",
                width: size.width, fit: BoxFit.fitWidth),
          ),
          child
        ],
      ),
    );
  }
}
