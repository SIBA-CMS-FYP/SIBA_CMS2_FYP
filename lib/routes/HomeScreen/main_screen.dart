import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/routes/event.dart';
import 'package:siba_cms_2/routes/finance.dart';
import 'package:siba_cms_2/routes/notifications.dart';
import 'package:siba_cms_2/routes/course.dart';
import 'package:siba_cms_2/routes/dashboard.dart';
import 'package:siba_cms_2/routes/terms.dart';
import 'package:siba_cms_2/routes/my_drawer_header.dart';
import 'package:siba_cms_2/routes/privacy_policy.dart';
import 'package:siba_cms_2/routes/logout.dart';
import 'package:siba_cms_2/routes/settings.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var cms;
  @override
  void initState() {
    _loadCourses();
    _loadEnrollKey();
    super.initState();
  }

  _loadEnrollKey() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = (prefs.getString('cms'));
      fetchEnroll(cms.toString());
      print(prefs.getInt("enrollID"));
    });
  }

  Future<void> _loadCourses() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = prefs.getString('cms');
    });
  }

  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.course) {
      container = Courses(1001);
    } else if (currentPage == DrawerSections.terms) {
      container = Terms();
    } else if (currentPage == DrawerSections.events) {
      container = EventsActivity();
    } else if (currentPage == DrawerSections.fees) {
      container = Finance();
    } else if (currentPage == DrawerSections.settings) {
      container = CourseWithdraw();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationActivity();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = LogoutPage();
    }
    return Scaffold(
      appBar: AppBar(title: const Text("SIBA CMS")),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer("Hans"),
              MyDrawerList(),
            ],
          ),
        ),
      ),
      extendBody: true,
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
              if (index == 0) {
                currentPage = DrawerSections.dashboard;
              } else if (index == 1) {
                currentPage = DrawerSections.terms;
              } else if (index == 2) {
                currentPage = DrawerSections.course;
              } else if (index == 3) {
                currentPage = DrawerSections.fees;
              }
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Terms", Icons.list,
              currentPage == DrawerSections.terms ? true : false),
          menuItem(3, "Finance", Icons.currency_pound,
              currentPage == DrawerSections.fees ? true : false),
          Divider(),
          menuItem(4, "Withdraw", Icons.book_online_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(5, "Result", Icons.card_giftcard,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(6, "Feedback", Icons.note,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(7, "Log out", Icons.arrow_forward,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.terms;
            } else if (id == 3) {
              currentPage = DrawerSections.fees;
            } else if (id == 4) {
              currentPage = DrawerSections.settings;
            } else if (id == 5) {
              currentPage = DrawerSections.notifications;
            } else if (id == 6) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 7) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  terms,
  course,
  events,
  fees,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
