import 'package:flutter/material.dart';
import 'package:siba_cms_2/activities/Events_Activity.dart';
import 'package:siba_cms_2/activities/News.dart';
import 'package:siba_cms_2/activities/Notifications.dart';

class HomeScreen extends StatelessWidget {
  final List<String> itemsName = ["Profile", "Course", "Attendance", "Result"];
  final List<String> imagespath = [
    "assets/images/profile.jpg",
    "assets/images/courses.jpg",
    "assets/images/attendance.png",
    "assets/images/result1.jpg"
  ];
  final screens = [
    const EventsActivity(),
    const NewsActivity(),
    const NotificationActivity(),
  ];

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white60,
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          4,
          (index) {
            return Card(
              elevation: 50,
              shadowColor: const Color.fromARGB(255, 197, 194, 194),
              child: Center(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(imagespath[index], width: 100, height: 100),
                      const Divider(),
                      Text(
                        itemsName[index],
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
