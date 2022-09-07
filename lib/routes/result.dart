import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/components/constants.dart';
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
  int vIndex = 0;
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
      print(enrollid);
      studentResultData = fetchResult(cmss.toString(), enrollid);
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
        child: FutureBuilder<StudentResults>(
          future: studentResultData,
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
                          child: index == 0
                              ? ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  textColor: Colors.white,
                                  tileColor: Color.alphaBlend(
                                    Color.fromARGB(255, 41, 55, 124),
                                    Color.fromRGBO(39, 115, 171, 1),
                                  ),
                                  leading: const Icon(
                                    CupertinoIcons.book,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'GPA ${resultData.data!.row[0].GPA.toString()}  CGPA ${resultData.data!.row[0].GPA.toString()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        Card(
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            textColor: Colors.white,
                            tileColor: Color.alphaBlend(
                              Color.fromARGB(255, 41, 55, 124),
                              Color.fromRGBO(39, 115, 171, 1),
                            ),
                            title: Text(resultData.data!.row[index].Course),
                            leading: const Icon(
                              CupertinoIcons.book,
                              color: Colors.white,
                            ),
                            trailing: Text(
                                ' ${resultData.data!.row[index].firstMid}  ${resultData.data!.row[index].secondMid} ${resultData.data!.row[index].finalExam}   '),
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
