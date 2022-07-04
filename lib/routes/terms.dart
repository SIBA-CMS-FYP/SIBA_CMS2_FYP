import 'package:flutter/material.dart';
import 'package:siba_cms_2/routes/details.dart';

class Terms extends StatelessWidget {
  final totalterms;
  Terms(this.totalterms);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListview(context),
    );
  }

  ListView _buildListview(BuildContext context) {
    final totalterms = ["Fall", "Spring", "Summer"];
    return ListView.builder(
      itemCount: totalterms.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(totalterms[index]),
            leading: index == 0
                ? const Icon(Icons.add_to_home_screen)
                : index == 1
                    ? const Icon(Icons.cloud)
                    : Icon(Icons.access_alarm),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(totalterms[index])))
            },
          ),
        );
      },
    );
  }
}
