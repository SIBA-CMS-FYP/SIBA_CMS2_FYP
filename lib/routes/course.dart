import 'package:flutter/material.dart';
import 'package:siba_cms_2/models/courses_model.dart';
import 'package:siba_cms_2/models/http.dart';

<<<<<<< HEAD
class Courses extends StatefulWidget {
  // String index;
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  void initState() {
    refreshUsers();
  }

  List<Course> courses = [];
  Future<void> refreshUsers() async {
    var result = await http_get('users');
    if (result.ok) {
      setState(() {
        courses.clear();
        var in_users = result.data as List<dynamic>;
        in_users.forEach((in_user) {
          courses.add(
              Course(in_user['Course_id'].toString(), in_user['Course_Title']));
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
              itemCount: courses.length,
              itemBuilder: (context, i) => ListTile(
                leading: const Icon(Icons.person),
                title: Text(courses[i].Course_Title),
              ),
              separatorBuilder: (context, i) => Divider(),
            ),
          ),
        ],
      ),
=======
class course extends StatelessWidget {
  const course({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
          child: Text(
        "courses",
        textScaleFactor: 2,
      )),
>>>>>>> 707094c (solve null safety issues)
    );
  }
}
