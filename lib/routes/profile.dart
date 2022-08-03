import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/http.dart';
import 'package:siba_cms_2/models/student_data.dart';

class Profile extends StatefulWidget {
  String? cms;
  Profile({Key? key, this.cms}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Future<StudentProfile>? studentData;
  var cmss;
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      fetchStudent(cmss.toString());
    });
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cmss = (prefs.getString('cms'));
      studentData = fetchStudent(cmss.toString());
      print(cmss);
    });
  }

  void savedata() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {});
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
        child: FutureBuilder<StudentProfile>(
          future: studentData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(
                      snapshot.data!.firstName + " " + snapshot.data!.lastName),
                  Text(snapshot.data!.cms),
                  Text(snapshot.data!.email),
                  Text(snapshot.data!.phone),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
