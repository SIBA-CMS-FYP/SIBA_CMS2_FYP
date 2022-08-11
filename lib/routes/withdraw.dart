import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/withdraw_courses.dart';

class CourseWithdraw extends StatefulWidget {
  const CourseWithdraw({Key? key}) : super(key: key);

  @override
  _CourseWithdrawState createState() => _CourseWithdrawState();
}

class _CourseWithdrawState extends State<CourseWithdraw> {
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
                      trailing: ElevatedButton(
                        onPressed: () => {
                          setState: {
                            SendWithdrawReq(
                                // cData.data[index].enrollID
                                )
                          }
                        },
                        child: Text("Withdraw"),
                      ),
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

class SendWithdrawReq extends StatefulWidget {
  SendWithdrawReq();

  @override
  _SendWithdrawReq createState() => _SendWithdrawReq();
}

class _SendWithdrawReq extends State<SendWithdrawReq> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
