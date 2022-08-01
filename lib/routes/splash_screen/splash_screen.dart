import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/authentication/login.dart';
import 'package:siba_cms_2/routes/HomeScreen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  var cmss;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCrediantal();
  }

  Future<void> getCrediantal() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cmss = prefs.getString('cms');
    print(cmss);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset("assets/images/iba_logo.png"),
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      // backgroundColor: Colors.blueAccent,
      backgroundColor: const Color.fromARGB(200, 64, 106, 212),
      nextScreen: cmss != null ? LogIn() : MainScreen(),
    );
  }
}
