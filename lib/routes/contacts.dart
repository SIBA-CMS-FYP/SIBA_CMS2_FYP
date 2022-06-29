import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siba_cms_2/routes/details.dart';

class ContactsPage extends StatelessWidget {
 final totalterms;
ContactsPage(this.totalterms);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _buildListview(context),
    );
  }
  ListView _buildListview(BuildContext context){
     final totalterms = ["Fall", "Spring", "Summer"];
    return ListView.builder(
      itemCount: totalterms.length,
    itemBuilder: (context, index){
      return Card(
        child: ListTile(
          title: new Text(totalterms[index]),
          leading: index==0?Icon(Icons.add_home):index==1?Icon(Icons.cloud):Icon(Icons.access_alarm),
          trailing: Icon(Icons.arrow_forward),
          onTap: () =>
          {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
            Details(totalterms[index])))
          },

        ),
      );
    },
    );
  }
}
