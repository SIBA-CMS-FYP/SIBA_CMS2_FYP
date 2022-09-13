import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/components/constants.dart';
import 'package:siba_cms_2/models/attendance_Model.dart';
import 'package:siba_cms_2/models/http_model.dart';

import 'package:siba_cms_2/routes/attendance_sub.dart';

class Attendence extends StatefulWidget {
  Attendence({Key? key}) : super(key: key);

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  Future<StudentAttendance>? attendanceData;
  var cmss;
  var enrollid;

  @override
  void initState() {
    _loadAttendance();
    super.initState();
  }

  Future<void> _loadAttendance() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cmss = (prefs.getString('cms'));
      enrollid = (prefs.getInt('enrollID'));
      print(enrollid);
      attendanceData = fetchAttendance(cmss.toString(), enrollid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
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
        child: FutureBuilder<StudentAttendance>(
          future: attendanceData,
          builder: (context, resultData) {
            if (resultData.hasData) {
              return ListView.builder(
                itemCount: resultData.data!.row.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            textColor: Colors.white,
                            tileColor: Color.alphaBlend(
                              const Color.fromARGB(255, 30, 50, 151),
                              const Color.fromARGB(255, 8, 119, 231),
                            ),
                            title: Text(
                                '${resultData.data!.row[index].CourseTitle}'),
                            leading: const Icon(
                              CupertinoIcons.book,
                              color: Colors.white,
                            ),
                            trailing: Text("P" +
                                '=> ${resultData.data!.row[index].Present} | A=> ${resultData.data!.row[index].Absent} '),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AttendenceBYSub(
                                          cmss,
                                          enrollid,
                                          resultData
                                              .data!.row[index].courseCode)))
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (resultData.hasError) {
              return Text('${resultData.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
