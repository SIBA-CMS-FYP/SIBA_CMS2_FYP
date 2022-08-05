import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/courses_model.dart';

import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/routes/details.dart';

class Courses extends StatefulWidget {
  int enrollId;
  Courses(this.enrollId);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  Future<StudentCourses>? studentCourses;
  var cms;
  @override
  void initState() {
    _loadCourses();
    super.initState();
  }

  Future<void> _loadCourses() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = prefs.getString('cms');
      studentCourses = fetchCourses(cms.toString(), widget.enrollId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Profile'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: Center(
            child: FutureBuilder<StudentCourses>(
          future: studentCourses,
          builder: (context, Coursesdata) {
            if (Coursesdata.hasData) {
              return ListView.builder(
                itemCount: Coursesdata.data!.row.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(Coursesdata.data!.row[index].title),
                      leading: index == 0
                          ? const Icon(Icons.cloud)
                          : index == 1
                              ? const Icon(Icons.spa)
                              : Icon(Icons.access_alarm),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         Courses(Coursesdata.data!.row[index].enrollId),
                        //   ),
                        // ),
                      },
                    ),
                  );
                },
              );
            } else if (Coursesdata.hasError) {
              return Text('${Coursesdata.error}');
            }
            return const CircularProgressIndicator();
          },
        )));
  }
}
