import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/course.dart';
import 'package:siba_cms_2/routes/dashboard.dart';

class Attendence extends StatelessWidget {
  final totalterms;
  Attendence(this.totalterms);

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
      body: _buildListview(context),
    );
  }
    ListView _buildListview(BuildContext context){
     final totalterms = ["database", "web development", "Robotics", "parallel", "cyber security"];
    return ListView.builder(
      itemCount: totalterms.length,
    itemBuilder: (context, index){
      return Card(
        child: ListTile(
          title: new Text(totalterms[index]),
           shape: RoundedRectangleBorder(side: BorderSide(
             color: Colors.blueAccent,
           ),
           ),
          leading: index==0?Icon(Icons.add_home):index==1?Icon(Icons.cloud):Icon(Icons.access_alarm),
          onTap: () =>
          {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
            course(totalterms[index])))
          },

        ),
      );
    },

    );
  }
}
