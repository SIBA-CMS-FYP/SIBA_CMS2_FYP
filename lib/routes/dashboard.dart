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
  Card dashboardCard(String img, String _title) {
    return Card(
        margin: EdgeInsets.all(20),
        elevation: 9.0,
        shadowColor: Color.fromARGB(96, 143, 142, 142),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 169, 166, 166))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.all(7),
              child: Image.asset("assets/images/" + img + ".png")),
          const SizedBox(height: 7),
          Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]));
  }

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
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: <Widget>[
                        InkWell(
                            hoverColor: Color.fromARGB(96, 143, 142, 142),
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Profile(),
                                    ),
                                  ),
                                },
                            child: dashboardCard("profile", "Profile")),
                        InkWell(
                          hoverColor: Color.fromARGB(96, 143, 142, 142),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CurrentEnroll(),
                              ),
                            ),
                          },
                          child: dashboardCard("course", "Courses"),
                        ),
                        InkWell(
                            hoverColor: Color.fromARGB(96, 143, 142, 142),
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Attendence(),
                                    ),
                                  ),
                                },
                            child: dashboardCard("attendance", "Attendance")),
                        InkWell(
                            hoverColor: Color.fromARGB(96, 143, 142, 142),
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Result(),
                                    ),
                                  ),
                                },
                            child: dashboardCard("result", "Result")),
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
