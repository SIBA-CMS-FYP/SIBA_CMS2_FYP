import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/components/constants.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/student_data.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class MyHeaderDrawer extends StatefulWidget {
  String name = "";
  MyHeaderDrawer(this.name, {Key? key}) : super(key: key);

  @override
  MyHeaderDrawerState createState() => MyHeaderDrawerState();
}

class MyHeaderDrawerState extends State<MyHeaderDrawer> {
  var cms;
  Future<StudentProfile>? studentData;

  @override
  initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = (prefs.getString('cms'));
      studentData = fetchStudent(cms.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StudentProfile>(
      future: studentData,
      builder: (context, profiledata) {
        if (profiledata.hasData) {
          var d = profiledata.data!;
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.indigo),
              borderRadius: BorderRadius.circular(10),
              color: myColor,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 210, 214, 239),
                  offset: Offset(0, 3),
                )
              ],
            ),
            // color: myColor,
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  child: WidgetCircularAnimator(
                    size: 250,
                    innerIconsSize: 3,
                    outerIconsSize: 3,
                    innerAnimation: Curves.easeInOutBack,
                    outerAnimation: Curves.easeInOutBack,
                    innerColor: Colors.deepPurple,
                    outerColor: Colors.orangeAccent,
                    innerAnimationSeconds: 10,
                    outerAnimationSeconds: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: Image.network(d.img),
                    ),
                  ),
                ),
                Text(
                  d.firstName + " " + d.lastName,
                  style: const TextStyle(color: myTextColor, fontSize: 20),
                ),
                Text(
                  d.cms,
                  style: const TextStyle(
                    color: myTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        } else if (profiledata.hasError) {
          return Text('${profiledata.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
