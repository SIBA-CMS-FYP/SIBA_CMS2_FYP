import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/courses_model.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/result_model.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Future<StudentResults>? studentResultData;
  Future<StudentCourses>? studentCourses;
  var cmss;
  var enrollid;

  @override
  void initState() {
    _loadResult();
    super.initState();
  }

  Future<void> _loadResult() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cmss = (prefs.getString('cms'));
      enrollid = (prefs.getInt('enrollID'));
      studentResultData = fetchResult(cmss.toString(), enrollid);
      // studentCourses = fetchCourses(cmss.toString(), 1001);
    });
  }

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
        child: FutureBuilder<StudentResults>(
          future: studentResultData,
          builder: (context, Coursesdata) {
            print(Coursesdata.hasData);
            if (Coursesdata.hasData) {
              return ListView.builder(
                itemCount: Coursesdata.data!.row.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(Coursesdata.data!.row[index].Course),
                      leading: Icon(Icons.book_rounded),
                      trailing: Text(
                          '${Coursesdata.data!.row[index].firstMid}  ${Coursesdata.data!.row[index].secondMid}  '),
                      onTap: () => {},
                    ),
                  );
                },
              );
            } else if (Coursesdata.hasError) {
              return Text('${Coursesdata.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

// class SResult {
//   final String title;
//   final double

// }
