import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/components/constants.dart';
import 'package:siba_cms_2/models/attendance_Model.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:siba_cms_2/routes/attendance_sub.dart';

class Attendence extends StatefulWidget {
  Attendence({Key? key}) : super(key: key);

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  Future<StudentAttendance>? attendanceData;
  late List<PresentAb> _chartData;
  var cmss;
  var enrollid;

  @override
  void initState() {
    _loadAttendance();
    // _chartData = getData();
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
                itemCount: resultData.data!.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          color: Colors.white38,
                          // Color.alphaBlend(
                          //   const Color.fromARGB(255, 30, 50, 151),
                          //   const Color.fromARGB(255, 8, 119, 231),
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    CupertinoIcons.book,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '${resultData.data!.data[index].CourseTitle}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.start,
                                  ),
                                  Expanded(child: SizedBox()),
                                  SizedBox(
                                      width: 155,
                                      height: 75,
                                      child: SfCircularChart(
                                        legend: Legend(isVisible: true),
                                        series: <CircularSeries>[
                                          PieSeries<PresentAb, String>(
                                            strokeColor:
                                                Color.fromARGB(255, 0, 7, 212),
                                            dataSource: [
                                              PresentAb(
                                                  "P",
                                                  resultData.data!.data[index]
                                                      .Present,
                                                  Colors.blue),
                                              PresentAb(
                                                  "A",
                                                  resultData
                                                      .data!.data[index].Absent,
                                                  Colors.red)
                                            ],
                                            pointColorMapper:
                                                (PresentAb data, _) =>
                                                    data.color,
                                            xValueMapper: (PresentAb data, _) =>
                                                data.status,
                                            yValueMapper: (PresentAb data, _) =>
                                                data.valus,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                    isVisible: true),
                                            name: 'Data',
                                          ),
                                        ],
                                      ))
                                ]),
                          ),
                        )
                        // ListTile(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   textColor: Colors.white,
                        //   tileColor: Color.alphaBlend(
                        //     const Color.fromARGB(255, 30, 50, 151),
                        //     const Color.fromARGB(255, 8, 119, 231),
                        //   ),
                        //   title: Text(
                        //       '${resultData.data!.data[index].CourseTitle}'),
                        //   leading: const Icon(
                        //     CupertinoIcons.book,
                        //     color: Colors.white,
                        //   ),
                        //   trailing: Column(
                        //     children: [
                        //       Row(
                        //         children: [Text("Present")],
                        //       ),
                        //       Row(
                        //         children: [Text("Absent")],
                        //       ),
                        //     ],
                        //   ),

                        //   // trailing: Text("P" +
                        //   //     '=> ${resultData.data!.row[index].Present} | A=> ${resultData.data!.row[index].Absent} '),
                        //   onTap: () => {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => AttendenceBYSub(
                        //                 cmss,
                        //                 enrollid,
                        //                 resultData
                        //                     .data!.data[index].courseCode)))
                        //   },
                        // ),
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

  // List<PresentAb> getData() {
  //   final List<PresentAb> chartData = [
  //     PresentAb("Present", 30),
  //     PresentAb("Absent", 2),
  //   ];
  //   return chartData;
  // }
}

class PresentAb {
  String status;
  int valus;
  Color color;
  PresentAb(this.status, this.valus, this.color);
}
