import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/attendence.dart';


class Result extends StatelessWidget {
final totalterms;
  Result(this.totalterms);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.lightBlue,
        title: Text('Results'),
        leading: IconButton(
          onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(
          Icons.arrow_back_ios,

        ),
        ),
      ),
      body:_listResult(context),
    );
  }
  
 

  ListView _listResult(BuildContext context){
     final totalterms = ["database", "web development", "Robotics", "parallel", "cyber security"];
      final grades = ['A', 'B', 'c', 'D','E'];   
    return ListView.builder(
      itemCount: totalterms.length,
    itemBuilder: (context, index){
      return Card(
        child: ListTile(
         

          title: new Text(totalterms[index]),
          subtitle: new Text('grade '+ grades[index]),
           shape: RoundedRectangleBorder(side: BorderSide(
             color: Colors.blueAccent,
           ),
           ),
          //leading: index==0?Icon(Icons.add_home):index==1?Icon(Icons.cloud):Icon(Icons.access_alarm),
       leading: Image(image: AssetImage("assets/images/result.png",)),

        ),
      );
    },
    );
  }
}