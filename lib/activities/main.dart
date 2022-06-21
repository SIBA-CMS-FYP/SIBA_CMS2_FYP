import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:siba_cms_2/activities/Events_Activity.dart';
import 'package:siba_cms_2/activities/News.dart';
import 'package:siba_cms_2/activities/Notifications.dart';
import 'package:siba_cms_2/widgets/category_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
  
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
                          title: "profile",
                          images: "assets/images/profile.jpg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return  EventsActivity();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "course",
                          images: "assets/images/courses.jpg",
                          press: () {
                          
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return  EventsActivity();
                              }),
                            );
                          
                          },
                        ),
                        CategoryCard(
                          title: "attendence",
                          images: "assets/images/attendance.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return  EventsActivity();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Result",
                          images: "assets/images/attendance.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return  EventsActivity();
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

