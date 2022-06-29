import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/HomeScreen/main_screen.dart';
import 'package:siba_cms_2/components/constants.dart';
import 'package:siba_cms_2/routes/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const SplashScreen(),
      home: const MainScreen(),
    );
  }
}
