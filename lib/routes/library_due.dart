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
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            textColor: Colors.white,
                            tileColor: Color.alphaBlend(
                              const Color.fromARGB(255, 30, 50, 151),
                              const Color.fromARGB(255, 8, 119, 231),
                            ),
                            leading: const Icon(
                              CupertinoIcons.book,
                              color: Colors.white,
                            ),
                            title:
                                Text('${feeData.data!.row[index].BookIssue}'),
                            trailing: Text(feeData.data!.row[index].issueDate +
                                "  | " +
                                feeData.data!.row[index].dueDate +
                                " | " +
                                feeData.data!.row[index].Due.toString()),
                          ),
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
