import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/components/constants.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/routes/library_due.dart';
import 'package:siba_cms_2/routes/finance.dart';
import 'package:siba_cms_2/routes/notifications.dart';
import 'package:siba_cms_2/routes/course.dart';
import 'package:siba_cms_2/routes/dashboard.dart';
import 'package:siba_cms_2/routes/terms.dart';
import 'package:siba_cms_2/routes/my_drawer_header.dart';
import 'package:siba_cms_2/routes/privacy_policy.dart';
import 'package:siba_cms_2/routes/logout.dart';
import 'package:siba_cms_2/routes/withdraw.dart';

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

  Color colors = myColor;

  _loadEnrollKey() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = (prefs.getString('cms'));
      fetchEnroll(cms.toString());
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
      container = FinanceLibrary();
    } else if (currentPage == DrawerSections.fees) {
      container = Finance();
    } else if (currentPage == DrawerSections.settings) {
      container = CourseWithdraw();
    } else if (currentPage == DrawerSections.notifications) {
      container = const FinanceLibrary();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = FeedBack();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = const LogoutPage();
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text("SIBA CMS"),
          foregroundColor: myTextColor,
          backgroundColor: myColor),
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
          color: myColor,
          buttonBackgroundColor: myColor,
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
          menuItem(4, "Withdraw", Icons.book_online_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(5, "Library", Icons.card_giftcard,
              currentPage == DrawerSections.notifications ? true : false),
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
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          elevation: selected ? 10.0 : 0.0,
          shadowColor: Color.fromARGB(255, 12, 103, 163),
          color: colors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
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
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      icon,
                      size: 20,
                      color: myTextColor,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: myTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
