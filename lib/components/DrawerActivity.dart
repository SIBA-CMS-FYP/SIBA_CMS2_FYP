import 'package:flutter/material.dart';

class DrawerActivity extends StatelessWidget {
  const DrawerActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          accountName: Text('Hans Raj'),
          accountEmail: Text('023-18-0020'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.black26,
            child: Text('H'),
          ),
          decoration: BoxDecoration(color: Colors.orange),
        ),
        const ListTile(
          leading: Icon(Icons.library_books),
          title: Text('My Course'),
        ),
        const ListTile(
          leading: Icon(Icons.list_outlined),
          title: Text('Terms'),
        ),
        const ListTile(
          leading: Icon(Icons.calendar_month_outlined),
          title: Text('Attendance'),
        ),
        const ListTile(
          leading: Icon(Icons.currency_pound),
          title: Text('Finance'),
        ),
        const ListTile(
          leading: Icon(Icons.book_online_outlined),
          title: Text('Withdraw'),
        ),
        ListTile(
          leading: const Icon(Icons.card_giftcard),
          title: const Text('Result'),
          onTap: () {},
        ),
        const ListTile(
          leading: Icon(Icons.note),
          title: Text('Feedback'),
        ),
        const ListTile(
          leading: Icon(Icons.arrow_forward),
          title: Text('Log out'),
        ),
      ],
    ));
  }
}
