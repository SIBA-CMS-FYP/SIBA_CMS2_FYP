import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Terms",
      //   ),
      // ),
      body: _buildListview(),
    );
  }
  ListView _buildListview(){
    final totalterms = ["Fall", "Spring", "Summer"];
    return ListView.builder(
      itemCount: totalterms.length,
    itemBuilder: (context, index){
      return Card(
        child: ListTile(
          title: new Text(totalterms[index]),
          leading: index==0?Icon(Icons.add_home):index==1?Icon(Icons.cloud):Icon(Icons.access_alarm),
        ),
      );
    },
    );
  }
}
