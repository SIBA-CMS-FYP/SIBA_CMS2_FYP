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
      Uri.parse('http://localhost:3000/withdraw/sendWithdrawReq'),
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
      Uri.parse('http://localhost:3000/getCurrent/withdrawCResponse'),
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
                  return Card(
                    child: ListTile(
                        title: Text(cData.data[index].title),
                        leading: Icon(Icons.book_online_rounded),
                        trailing: (cData.data[index].isWithdraw == 1)
                            ? ElevatedButton(
                                onPressed: null,
                                child: Text("pending"),
                              )
                            : ElevatedButton(
                                onPressed: () => {
                                  setState(
                                    () {
                                      updateisWithdraw(cData.data[index].cms,
                                          cData.data[index].course_Code);
                                      // sendWithdrawdata(
                                      //     int.parse(cData.data[index].courseId),
                                      //     cData.data[index].cms,
                                      //     cData.data[index].teacherId,
                                      //     cData.data[index].enrollID);
                                    },
                                  ),
                                },
                                child: Text("Withdraw"),
                              )),
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

// class SendWR {
//   final int course_id;
//   final int isWithdraw;
//   final String cms;
//   final String teacher_id;
//   final int enroll_id;

//   const SendWR(
//       {required this.course_id,
//       required this.isWithdraw,
//       required this.cms,
//       required this.teacher_id,
//       required this.enroll_id});

//   factory SendWR.fromJson(Map<String, dynamic> json) {
//     return SendWR(
//         course_id: json['course_id'],
//         isWithdraw: json['course_id'],
//         cms: json['cms'],
//         teacher_id: json['teacher_id'],
//         enroll_id: json['enroll_id']);
//   }
// }
class IsWithdrawCheck {
  IsWithdrawCheck({
    required this.data,
  });
  late final List<Data> data;

  IsWithdrawCheck.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.isWithdraw,
  });
  late final int isWithdraw;

  Data.fromJson(Map<String, dynamic> json) {
    isWithdraw = json['isWithdraw'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isWithdraw'] = isWithdraw;
    return _data;
  }
}
