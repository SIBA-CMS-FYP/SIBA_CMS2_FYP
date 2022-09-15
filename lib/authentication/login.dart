import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:siba_cms_2/routes/HomeScreen/main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:siba_cms_2/components/background.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

const PROTOCOL = "http";

const DOMAIN = "192.168.220.60:8080";

class _LogInState extends State<LogIn> {
  final TextEditingController cms = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>(); //key for form

  void studyLogin() async {
    print("clicks");
    var url = "http://$DOMAIN/authentication/login";
    var data = {
      "cms": cms.text,
      "password": password.text,
    };
    var res = await http.post(Uri.parse(url), body: data);
    var resData = jsonDecode(res.body);
    if (resData["success"].toString() == "true") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('cms', cms.text);
      prefs.setString("password", password.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      Fluttertoast.showToast(
          msg: "incorrect password", toastLength: Toast.LENGTH_SHORT);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFffffff),
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey, //key for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.01),
                  const Text(
                    "Welcome To",
                    style: TextStyle(fontSize: 28, color: Color(0xFF363f93)),
                  ),
                  const Text(
                    "SIBA CMS 2.0",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFF363f93),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    controller: cms,
                    decoration: const InputDecoration(
                      labelText: "Enter you CMS",
                      border: OutlineInputBorder(),
                    ),
                    validator: (userCms) {
                      if (userCms!.isEmpty ||
                          !RegExp(r'^\d{3}\-\d{2}\-\d{4}$').hasMatch(userCms)) {
                        return "CMS can't be lessthan 11 char";
                      } else {
                        // name = userCms;
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Enter you Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? userPassword) {
                      if (userPassword!.isEmpty ||
                          !RegExp(r'^.{5,}').hasMatch(userPassword)) {
                        return "Password can't be Empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(200, 64, 106, 212),
                        padding: EdgeInsets.all(20)),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        studyLogin();
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     NeumorphicButton(
                  //       margin: EdgeInsets.only(top: 12, left: width / 2 + 50),
                  //       onPressed: () async {
                  //         if (formKey.currentState!.validate()) {
                  //           studyLogin();
                  //         }
                  //       },
                  //       style: NeumorphicStyle(
                  //           shape: NeumorphicShape.convex,
                  //           boxShape: NeumorphicBoxShape.roundRect(
                  //               BorderRadius.circular(100)),
                  //           depth: 5,
                  //           lightSource: LightSource.topLeft,
                  //           color: const Color.fromARGB(200, 64, 106, 212)),
                  //       padding: const EdgeInsets.all(12.0),
                  //       child: const Icon(
                  //         Icons.arrow_forward,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
