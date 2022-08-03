import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/attendence.dart';
import 'package:siba_cms_2/routes/profile.dart';
import 'package:siba_cms_2/routes/result.dart';
import 'package:siba_cms_2/widgets/category_card.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: .85,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: <Widget>[
                            CategoryCard(
                              title: "Profile",
                              images: "assets/images/profile.png",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                );
                              },
                            ),
                            CategoryCard(
                              title: "Courses",
                              images: "assets/images/course.png",
                              press: () {},
                            ),
                            CategoryCard(
                              title: "Attendence",
                              images: "assets/images/attendance.png",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Attendence(context);
                                  }),
                                );
                              },
                            ),
                            CategoryCard(
                              title: "Result",
                              images: "assets/images/result.png",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return result();
                                  }),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
