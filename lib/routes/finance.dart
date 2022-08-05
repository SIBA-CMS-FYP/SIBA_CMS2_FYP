import 'package:flutter/material.dart';
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
  var coursfees;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fees"),
      ),
      body: Center(
        child: FutureBuilder<StudentFees>(
          future: studentFees,
          builder: (context, feeData) {
            if (feeData.hasData) {
              return ListView.builder(
                itemCount: feeData.data!.row.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          title: Text(
                            "Course Fees " +
                                feeData.data!.row[index].courseFee.toString(),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                              "Hostel Fees ${feeData.data!.row[index].hostelFee}"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                              'Late Fees ${feeData.data!.row[index].lateFee}'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                              'Total Fees ${feeData.data!.row[index].courseFee + feeData.data!.row[index].hostelFee + feeData.data!.row[index].lateFee}'),
                        ),
                      ),
                    ],
                  );
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
