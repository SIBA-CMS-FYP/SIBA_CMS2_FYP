import 'package:flutter/material.dart';
import 'package:siba_cms_2/models/courses_model.dart';
import 'package:siba_cms_2/models/http.dart';

class Courses extends StatefulWidget {
  // String index;
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  void initState (){
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
          SizedBox(height: 10),
          Text("Courses"),
          SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: (() => {refreshUsers()}),
          //   child: Icon(Icons.refresh),
          // ),
          Expanded(
          
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (context, i) => ListTile(
                leading: Icon(Icons.person),
                title: Text(courses[i].Course_Title),
              ),
              separatorBuilder: (context, i) => Divider(),
            ),
            ),

        ],
      ),
    );
  }
}
