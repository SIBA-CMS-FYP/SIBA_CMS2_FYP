import 'package:flutter/material.dart';
// import 'package:push_notification/push_notification.dart';

class NotificationActivity extends StatelessWidget {
  const NotificationActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
          child: Text(
        "Notifivation pagese",
        textScaleFactor: 2,
      )),
    );
  }
}

// class MyAppNotif extends StatefulWidget {
//   const MyAppNotif({Key? key}) : super(key: key);

//   @override
//   _MyAppNotifState createState() => _MyAppNotifState();
// }

// class _MyAppNotifState extends State<MyAppNotif> {
//   late Notificator notification;

//   String notificationKey = 'key';
//   String _bodyText = 'notification test';

//   @override
//   void initState() {
//     super.initState();
//     notification = Notificator(
//       onPermissionDecline: () {
//         // ignore: avoid_print
//         print('permission decline');
//       },
//       onNotificationTapCallback: (notificationData) {
//         setState(
//           () {
//             _bodyText = 'notification open: '
//                 '${notificationData[notificationKey].toString()}';
//           },
//         );
//       },
//     )..requestPermissions(
//         requestSoundPermission: true,
//         requestAlertPermission: true,
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Text(_bodyText),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             notification.show(
//               1,
//               'hello',
//               'this is test',
//               imageUrl: 'https://www.lumico.io/wp-019/09/flutter.jpg',
//               data: {notificationKey: '[notification data]'},
//               notificationSpecifics: NotificationSpecifics(
//                 AndroidNotificationSpecifics(
//                   autoCancelable: true,
//                 ),
//               ),
//             );
//           },
//           child: const Icon(
//             Icons.notifications,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
