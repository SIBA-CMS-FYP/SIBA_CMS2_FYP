import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/fees_model.dart';
import 'package:siba_cms_2/models/http_model.dart';

class Finance extends StatefulWidget {
  const Finance({Key? key}) : super(key: key);

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  TextEditingController fees = TextEditingController();
  Future<StudentFees>? studentFees;

  var cms;
  @override
  void initState() {
    _loadFees();
    super.initState();
  }

  Future<void> _loadFees() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = prefs.getString('cms');
      studentFees = fetchFees(cms);
    });
  }

  ListTile CreateListTile(String season, String seasonName, int fee) {
    return ListTile(
      textColor: Colors.white,
      title: Text(
        season,
        style: TextStyle(color: Colors.black),
      ),
      tileColor: Colors.white,
      leading: ProfilePicture(
        name: seasonName,
        fontsize: 13,
        radius: 13,
      ),
      trailing: Text("Rs : " + '$fee', style: TextStyle(color: Colors.black)),
    );
  }

  Card CreateAcadmicCard(String titleText, int fee) {
    return Card(
      color: Color.alphaBlend(const Color.fromARGB(255, 41, 55, 124),
          const Color.fromRGBO(39, 115, 171, 1)),
      child: ExpansionTile(
        title: Text(
          titleText,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text("Rs : " + (127000).toString(),
            style: TextStyle(color: Colors.white)),
        leading: const Icon(
          Icons.class_,
          color: Colors.white,
        ),
        children: [
          CreateListTile("Academic Fee F18:", "Fall", 0),
          CreateListTile("Academic Fee S19:", "Spring", 0),
          CreateListTile("Academic Fee F19:", "Fall", 0),
          CreateListTile("Academic Fee S20:", "Spring", 0),
          CreateListTile("Academic Fee F19:", "Fall", 0),
          CreateListTile("Academic Fee S21:", "Spring", 0),
          CreateListTile("Academic Fee F21:", "Fall", 40000),
          CreateListTile("Academic Fee S22:", "Spring", 87000),
        ],
      ),
    );
  }

  Card CreateHostelCard(String titleText, int fee) {
    return Card(
      color: Color.alphaBlend(const Color.fromARGB(255, 41, 55, 124),
          const Color.fromRGBO(39, 115, 171, 1)),
      child: ExpansionTile(
        title: Text(
          titleText,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text("Rs : " + (28000).toString(),
            style: TextStyle(color: Colors.white)),
        leading: const Icon(
          Icons.class_,
          color: Colors.white,
        ),
        children: [
          CreateListTile("Hostel Fee F18:", "Fall", 0),
          CreateListTile("Hostel Fee S19:", "Spring", 0),
          CreateListTile("Hostel Fee F19:", "Fall", 0),
          CreateListTile("Hostel Fee S20:", "Spring", 0),
          CreateListTile("Hostel Fee F19:", "Fall", 0),
          CreateListTile("Hostel Fee S21:", "Spring", 0),
          CreateListTile("Hostel Fee F21:", "Fall", 10000),
          CreateListTile("Hostel Fee S22:", "Spring", 18000),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<StudentFees>(
          future: studentFees,
          builder: (context, feeData) {
            if (feeData.hasData) {
              return ListView.builder(
                itemCount: feeData.data!.row.length,
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const ListTile(
                          textColor: Colors.black,
                          title: Center(
                            child: Text(
                              "Fees Information",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CreateAcadmicCard(
                            "Acadmic Fee", feeData.data!.row[index].courseFee),
                        const SizedBox(
                          height: 10,
                        ),
                        CreateHostelCard(
                            "Hostel Fee", feeData.data!.row[index].hostelFee),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Color.alphaBlend(
                              const Color.fromARGB(255, 41, 55, 124),
                              const Color.fromRGBO(39, 115, 171, 1)),
                          child: ExpansionTile(
                            title: Text(
                              "Late Fee ",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                                'Rs : ' + '${feeData.data!.row[index].lateFee}',
                                style: TextStyle(color: Colors.white)),
                            leading: const Icon(
                              Icons.class_,
                              color: Colors.white,
                            ),
                            children: [
                              CreateListTile("Fall 2021", "Fall",
                                  feeData.data!.row[index].lateFee)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Color.alphaBlend(
                              const Color.fromARGB(255, 41, 55, 124),
                              const Color.fromRGBO(39, 115, 171, 1)),
                          child: ExpansionTile(
                            title: Text(
                              "Total Fee",
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: const Icon(
                              Icons.class_,
                              color: Colors.white,
                            ),
                            trailing: Text((127000 + 5000 + 28000).toString()),
                          ),
                        ),
                      ]);
                },
              );
            } else if (feeData.hasError) {
              return Text('${feeData.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
