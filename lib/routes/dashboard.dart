import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/attendence.dart';
import 'package:siba_cms_2/routes/current_enroll.dart';
import 'package:siba_cms_2/routes/profile.dart';
import 'package:siba_cms_2/routes/result.dart';
import 'package:siba_cms_2/widgets/category_card.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                        Column(
                          children: [
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
                            Text(
                              "Profile",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CategoryCard(
                              title: "Courses",
                              images: "assets/images/course.png",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CurrentEnroll(),
                                  ),
                                );
                              },
                            ),
                            Text(
                              "Current Courses",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CategoryCard(
                              title: "Attendence",
                              images: "assets/images/attendance.png",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Attendence();
                                  }),
                                );
                              },
                            ),
                            Text(
                              "Attendance",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CategoryCard(
                              title: "Result",
                              images: "assets/images/result.png",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Result();
                                  }),
                                );
                              },
                            ),
                            Text(
                              "Result",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
