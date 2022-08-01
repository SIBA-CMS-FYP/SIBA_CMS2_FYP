import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/authentication/login.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _logout();
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cms');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext ctx) => LogIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
