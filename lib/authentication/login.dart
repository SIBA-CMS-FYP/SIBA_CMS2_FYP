import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:siba_cms_2/HomeScreen/main_screen.dart';
import 'package:siba_cms_2/backgroundComp/background.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
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
            child: SingleChildScrollView(
                child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const Text(
                  "Welcome To",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                const Text(
                  "SIBA CMS 2.0",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                SizedBox(height: height * 0.04),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter you CMS",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^\d{3}\-\d{2}\-\d{4}$').hasMatch(value)) {
                      return "Enter correct CMS";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.04),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Enter you Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^.{5,}').hasMatch(value)) {
                      return "Enter correct PAssword";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeumorphicButton(
                      margin: EdgeInsets.only(top: 12, left: width / 2 + 50),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()));
                        }
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(100)),
                          depth: 5,
                          lightSource: LightSource.topLeft,
                          color: Color.fromARGB(200, 64, 106, 212)),
                      padding: const EdgeInsets.all(12.0),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ))));
  }
}
