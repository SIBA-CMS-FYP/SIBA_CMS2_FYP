import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/current_semester.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/student_data.dart';

class CurrentEnroll extends StatefulWidget {
  CurrentEnroll({Key? key}) : super(key: key);

  @override
  State<CurrentEnroll> createState() => CurrentEnrollState();
}

class CurrentEnrollState extends State<CurrentEnroll> {
  Future<CurrentSemester>? studentDataCS;
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
      cms = (prefs.getString('cms'));
      studentDataCS = fetchCurrent(cms.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('CurrentEnroll'),
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
        child: FutureBuilder<CurrentSemester>(
          future: studentDataCS,
          builder: (context, enrollData) {
            if (enrollData.hasData) {
              return ListView.builder(
                itemCount: enrollData.data!.row.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      textColor: Colors.white,
                      tileColor: Color.alphaBlend(
                          Color.fromARGB(255, 41, 55, 124),
                          Color.fromRGBO(39, 115, 171, 1)),
                      title: Text(enrollData.data!.row[index].title),
                      leading: const Icon(
                        CupertinoIcons.book,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              );
            } else if (enrollData.hasError) {
              return Text('${enrollData.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
