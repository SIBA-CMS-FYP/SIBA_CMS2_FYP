// ignore: file_names
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:siba_cms_2/activities/Events_Activity.dart';
import 'package:siba_cms_2/activities/News.dart';
import 'package:siba_cms_2/activities/Notifications.dart';
import 'package:siba_cms_2/activities/dashboard.dart';
import 'package:siba_cms_2/activities/contacts.dart';
import 'package:siba_cms_2/activities/events.dart';
import 'package:siba_cms_2/activities/my_drawer_header.dart';
import 'package:siba_cms_2/activities/notes.dart';
import 'package:siba_cms_2/activities/notifications%20copy.dart';
import 'package:siba_cms_2/activities/privacy_policy.dart';
import 'package:siba_cms_2/activities/send_feedback.dart';
import 'package:siba_cms_2/activities/settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    DashboardPage(),
    const EventsActivity(),
    const NewsActivity(),
    const NotificationActivity(),
  ];
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(title: const Text("SIBA CMS")),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
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
                currentPage = DrawerSections.contacts;
              } else if (index == 2) {
                currentPage = DrawerSections.events;
              } else if (index == 3) {
                currentPage = DrawerSections.notes;
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
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "My Course", Icons.library_books,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Terms", Icons.list_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Attendance", Icons.calendar_month_outlined,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Finance", Icons.currency_pound,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Withdraw", Icons.book_online_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Result", Icons.card_giftcard,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Feedback", Icons.note,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Log out", Icons.arrow_forward,
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
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
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
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
