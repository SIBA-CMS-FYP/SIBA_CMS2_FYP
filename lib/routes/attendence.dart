import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/course.dart';
import 'package:siba_cms_2/routes/dashboard.dart';

<<<<<<< HEAD
class Attendence extends StatelessWidget {
  final totalterms;
  Attendence(this.totalterms);
=======
class attendence extends StatelessWidget {
  attendence({Key? key}) : super(key: key);
>>>>>>> 707094c (solve null safety issues)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
<<<<<<< HEAD
      body: _buildListview(context),
    );
  }

  ListView _buildListview(BuildContext context) {
    final totalterms = ["one", "two", "three"];
    return ListView.builder(
      itemCount: totalterms.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(totalterms[index]),
            leading: index == 0
                ? Icon(Icons.add_to_home_screen)
                : index == 1
                    ? Icon(Icons.cloud)
                    : Icon(Icons.access_alarm),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Courses()))
            },
          ),
        );
      },
=======
      body: Center(
          child: Text(
        "Attendence",
        textScaleFactor: 2,
      )),
>>>>>>> 707094c (solve null safety issues)
    );
  }
}
