import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/attendence.dart';
import 'package:siba_cms_2/routes/course.dart';
import 'package:siba_cms_2/routes/profile.dart';
import 'package:siba_cms_2/routes/result.dart';
import 'package:siba_cms_2/widgets/category_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
                          images: "assets/images/profile.jpg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return profile();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Courses",
                          images: "assets/images/courses.jpg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return course();
                              }),
                            );
                          },
                        ),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
