import 'package:flutter/material.dart';
import 'package:siba_cms_2/models/http.dart';
import 'package:siba_cms_2/models/student_data.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

late Future<StudentProfile> studentData;

class ProfileState extends State<Profile> {
  @override
  initState() {
    super.initState();
    studentData = fetchStudent("023-18-0030");
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

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
