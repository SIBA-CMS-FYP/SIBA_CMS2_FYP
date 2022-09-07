import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siba_cms_2/components/constants.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/sub_attendance.dart';

class AttendenceBYSub extends StatefulWidget {
  var cms;
  var enrollid;
  var course_code;
  AttendenceBYSub(this.cms, this.enrollid, this.course_code);

  @override
  State<AttendenceBYSub> createState() => _AttendenceBYSubState();
}

class _AttendenceBYSubState extends State<AttendenceBYSub> {
  late var cms = widget.cms;
  late var enrollid = widget.enrollid;
  late var course_code = widget.course_code;
  Future<AttendanceSubject>? attendanceBYSub;

  @override
  void initState() {
    _loadAttendance();
    super.initState();
  }

  Future<void> _loadAttendance() async {
    setState(() {
      attendanceBYSub = fetchAttendanceBySubj(cms, enrollid, course_code);
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
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<AttendanceSubject>(
          future: attendanceBYSub,
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
                            title: resultData.data!.row[index].attendance == 1
                                ? Text("P")
                                : Text(
                                    "A",
                                    style: TextStyle(color: Colors.red),
                                  ),
                            leading: const Icon(
                              CupertinoIcons.book,
                              color: Colors.white,
                            ),
                            trailing:
                                Text(' ${resultData.data!.row[index].Date} '),
                            onTap: () => {},
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
