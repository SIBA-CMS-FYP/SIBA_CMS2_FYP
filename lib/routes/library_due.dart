import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/fees_model.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/library_model.dart';

class FinanceLibrary extends StatefulWidget {
  const FinanceLibrary({Key? key}) : super(key: key);

  @override
  State<FinanceLibrary> createState() => _FinanceLibraryState();
}

class _FinanceLibraryState extends State<FinanceLibrary> {
  TextEditingController fees = TextEditingController();
  Future<LibraryModel>? studentLibFees;
  var cms;
  @override
  void initState() {
    _loadLibFees();
    super.initState();
  }

  Future<void> _loadLibFees() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = prefs.getString('cms');
      studentLibFees = fetchLibDue(cms);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<LibraryModel>(
          future: studentLibFees,
          builder: (context, feeData) {
            if (feeData.hasData) {
              return ListView.builder(
                itemCount: feeData.data!.row.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        index == 0
                            ? ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                textColor: Colors.black87,
                                leading: const Icon(
                                  CupertinoIcons.book,
                                  color: Colors.black87,
                                ),
                                title: const Text(
                                  '  Book  ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                trailing: const Text(
                                    "Due Date" +
                                        "  | " +
                                        "Submited Date" +
                                        " | " +
                                        "Due",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )
                            : SizedBox(),
                        Divider(),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textColor: Colors.black87,
                          leading: const Icon(
                            CupertinoIcons.book,
                            color: Colors.black87,
                          ),
                          title: Text(
                            '${feeData.data!.row[index].BookIssue}',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                              feeData.data!.row[index].dueDate +
                                  "   |    " +
                                  feeData.data!.row[index].submitDate +
                                  "    | " +
                                  feeData.data!.row[index].Due.toString(),
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
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
