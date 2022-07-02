import 'package:flutter/material.dart';
import 'package:siba_cms_2/models/http.dart';
import 'package:siba_cms_2/models/student_data.dart';

class Profile extends StatefulWidget {
  // String index;
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Future<void> initState() async {
    return refreshUsers();
  }

  List<Student> student = [];
  Future<void> refreshUsers() async {
    var result = await http_get_user('getUser');
    if (result.ok) {
      setState(() {
        student.clear();
        var in_users = result.data as List<dynamic>;
        in_users.forEach((in_user) {
          student.add(Student(
              in_user['studentCMSID'].toString(),
              in_user['semesterId'],
              in_user["studentName"],
              in_user['email'],
              in_user["phone"],
              in_user["enrollmentID"]));
        });
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: student.length,
              itemBuilder: (context, i) => ListTile(
                leading: Icon(Icons.person),
                title: Text(student[i].studentName),
              ),
              separatorBuilder: (context, i) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
