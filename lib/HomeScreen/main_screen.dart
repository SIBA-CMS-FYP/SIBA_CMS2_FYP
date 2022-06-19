// ignore: file_names
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:siba_cms_2/activities/Events_Activity.dart';
import 'package:siba_cms_2/activities/Home_Screen.dart';
import 'package:siba_cms_2/activities/News.dart';
import 'package:siba_cms_2/activities/Notifications.dart';
import 'package:siba_cms_2/components/DrawerActivity.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    HomeScreen(),
    const EventsActivity(),
    const NewsActivity(),
    const NotificationActivity(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: DrawerActivity(),
        ),
        extendBody: true,
        appBar: AppBar(title: const Text("SIBA CMS")),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 60.0,
            items: const <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.event, size: 30),
              Icon(Icons.newspaper, size: 30),
              Icon(Icons.notifications, size: 30),
            ],
            color: Colors.blueAccent,
            buttonBackgroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
        body: Container(child: screens[_page]));
  }
}
