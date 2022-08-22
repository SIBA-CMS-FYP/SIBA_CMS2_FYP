import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/semester_terms.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/routes/course.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  Future<StudentTerms>? studentTerms;
  var cms;
  @override
  void initState() {
    _loadTerms();
    super.initState();
  }

  Future<void> _loadTerms() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = prefs.getString('cms');
      studentTerms = fetchTerms(cms.toString());
     // print(cms);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<StudentTerms>(
          future: studentTerms,
          builder: (context, termsdata) {
            if (termsdata.hasData) {
              return ListView.builder(
                itemCount: termsdata.data!.row.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
           textColor: Colors.white,
           tileColor: Color.alphaBlend(Color.fromARGB(255, 41, 55, 124),  Color.fromRGBO(39, 115, 171, 1)),
                      title: Text(termsdata.data!.row[index].season +
                          " " +
                          termsdata.data!.row[index].year.toString()),
                      leading: termsdata.data!.row[index].season == 'spring'
                          ? const Icon(Icons.cloud, color: Colors.white,)
                          : termsdata.data!.row[index].season == 'Fall'
                              ? const Icon(Icons.spa, color: Colors.white,)
                              : Icon(Icons.access_alarm ,color: Colors.white,),
                      trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Courses(termsdata.data!.row[index].enrollID),
                          ),
                        ),
                      },
                    ),
                  );
                },
              );
            } else if (termsdata.hasError) {
              return Text('${termsdata.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
