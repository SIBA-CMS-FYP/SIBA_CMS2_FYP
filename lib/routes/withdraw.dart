import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/withdraw_courses.dart';

class CourseWithdraw extends StatefulWidget {
  const CourseWithdraw({Key? key}) : super(key: key);

  @override
  _CourseWithdrawState createState() => _CourseWithdrawState();
}

const DOMAIN = "192.168.102.60:8080";

class _CourseWithdrawState extends State<CourseWithdraw> {
  // Future<SendWR>? _futureRequest;
  Future<WithdrawCourse>? studentCourseForWithdraw;
  var cms;
  // var enrollId;
  @override
  initState() {
    super.initState();
    _loadCurrentEnroll();
  }

  Future<void> _loadCurrentEnroll() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = prefs.getString('cms');
      studentCourseForWithdraw = fetch_C_W(cms.toString());
    });
  }

  Future<void> sendWithdrawdata(
      int course_id, String cms, String teacher_id, String enroll_id) async {
    final response = await http.post(
      Uri.parse('http://$DOMAIN/withdraw/sendWithdrawReq'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'course_id': course_id,
          'cms': cms,
          'teacher_id': teacher_id,
          'enroll_id': enroll_id,
        },
      ),
    );
    var resp = jsonDecode(response.body);
    print(resp);

    if (resp["succes"].toString() == "true") {
      print(" call if");
      // return SendWR.fromJson(jsonDecode(response.body));
    } else {
      print("call else");
      throw Exception('Failed to Withdraw.');
    }
  }

  Future<void> updateisWithdraw(String cms, String course_Code) async {
    final response = await http.post(
      Uri.parse('http://$DOMAIN/getCurrent/withdrawCResponse'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'cms': cms,
          'course_Code': course_Code,
        },
      ),
    );
    var resp = jsonDecode(response.body);
    print(resp);

    if (resp.toString() == "1") {
      _loadCurrentEnroll();
      // return SendWR.fromJson(jsonDecode(response.body));
    } else {
      print("call else");
      throw Exception('Failed to Withdraw.');
    }
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    int countaccept = 0;
    return Scaffold(
      body: Center(
        child: FutureBuilder<WithdrawCourse>(
          future: studentCourseForWithdraw,
          builder: (context, Coursesdata) {
            if (Coursesdata.hasData) {
              return ListView.builder(
                itemCount: Coursesdata.data!.data.length,
                itemBuilder: (context, index) {
                  var cData = Coursesdata.data!;

                  count = cData.data[index].isTeacherAcp == 1 ||
                          cData.data[index].isWithdraw == 1
                      ? (count + 1)
                      : (count + 0);
                  print("Total Withdraw " + count.toString());
                  return Card(
                    child: cData.data[index].CGPA <= 2.33
                        ? count < 2
                            ? ListTile(
                                title: Text(cData.data[index].title),
                                leading: Icon(Icons.book_online_rounded),
                                trailing: ((cData.data[index].isTeacherAcp ==
                                            0 &&
                                        cData.data[index].isHODAcept == 0)
                                    ? ElevatedButton(
                                        onPressed: () => {
                                          setState(
                                            () {
                                              updateisWithdraw(
                                                  cData.data[index].cms,
                                                  cData.data[index].courseCode);
                                            },
                                          ),
                                        },
                                        child: Text("Withdraw"),
                                      )
                                    : (cData.data[index].isTeacherAcp == 1 &&
                                            cData.data[index].isHODAcept == 0)
                                        ? ElevatedButton(
                                            onPressed: null,
                                            child: Text("pending"),
                                          )
                                        : ElevatedButton(
                                            onPressed: null,
                                            child: Text("Accept"),
                                          )),
                              )
                            : Column(
                                children: [
                                  index == 0
                                      ? Text(
                                          "You Already Withdraw two Subject's",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23),
                                        )
                                      : Text(""),
                                  ListTile(
                                    title: Text(cData.data[index].title),
                                    leading: Icon(Icons.book_online_rounded),
                                    trailing: ((cData
                                                    .data[index].isTeacherAcp ==
                                                0 &&
                                            cData.data[index].isHODAcept == 0)
                                        ? ElevatedButton(
                                            onPressed: null,
                                            child: Text("Withdraw"),
                                          )
                                        : (cData.data[index].isTeacherAcp ==
                                                    1 &&
                                                cData.data[index].isHODAcept ==
                                                    0)
                                            ? ElevatedButton(
                                                onPressed: null,
                                                child: Text("pending"),
                                              )
                                            : ElevatedButton(
                                                onPressed: null,
                                                child: Text("Accept"),
                                              )),
                                  ),
                                ],
                              )
                        : count < 1
                            ? ListTile(
                                title: Text(cData.data[index].title),
                                leading: Icon(Icons.book_online_rounded),
                                trailing: ((cData.data[index].isTeacherAcp ==
                                            0 &&
                                        cData.data[index].isHODAcept == 0)
                                    ? ElevatedButton(
                                        onPressed: () => {
                                          setState(
                                            () {
                                              updateisWithdraw(
                                                  cData.data[index].cms,
                                                  cData.data[index].courseCode);
                                            },
                                          ),
                                        },
                                        child: Text("Withdraw"),
                                      )
                                    : (cData.data[index].isTeacherAcp == 1 &&
                                            cData.data[index].isHODAcept == 0)
                                        ? ElevatedButton(
                                            onPressed: null,
                                            child: Text("pending"),
                                          )
                                        : ElevatedButton(
                                            onPressed: null,
                                            child: Text("Accept"),
                                          )),
                              )
                            : Column(children: [
                                index == 0
                                    ? Text(
                                        "You Already Withdraw One Subject's",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                      )
                                    : Text(""),
                                ListTile(
                                  title: Text(cData.data[index].title),
                                  leading: Icon(Icons.book_online_rounded),
                                  trailing: ((cData.data[index].isTeacherAcp ==
                                              0 &&
                                          cData.data[index].isHODAcept == 0)
                                      ? ElevatedButton(
                                          onPressed: null,
                                          child: Text("Withdraw"),
                                        )
                                      : (cData.data[index].isTeacherAcp == 1 &&
                                              cData.data[index].isHODAcept == 0)
                                          ? ElevatedButton(
                                              onPressed: null,
                                              child: Text("pending"),
                                            )
                                          : ElevatedButton(
                                              onPressed: null,
                                              child: Text("Accept"),
                                            )),
                                ),
                              ]),
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
