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
    var feestotal;
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
                          textColor: Colors.black,
                          title: new Center( child: new Text(
                        "Fees Information",
                        style: new TextStyle (
                          fontWeight: FontWeight. bold,
                          fontSize: 20.0, ),
                          ),
                               ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(

                        child: ListTile(
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
           textColor: Colors.white,
           tileColor: Color.alphaBlend(Color.fromARGB(255, 41, 55, 124),  Color.fromRGBO(39, 115, 171, 1)),

                          title: Text(
                            "Academic Fees:"   ),
                          leading: Icon(Icons.class_, color: Colors.white,),
                           trailing: Text( feeData.data!.row[index].courseFee.toString()),
                        ),
                       
                      ),
                      Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
           textColor: Colors.white,
           tileColor: Color.alphaBlend(Color.fromARGB(255, 41, 55, 124),  Color.fromRGBO(39, 115, 171, 1)),
                          title: Text( " Hostel Fees:"),
                          leading: Icon(Icons.home, color: Colors.white,),
                          trailing: Text( feeData.data!.row[index].hostelFee.toString()
                          ),
                        ),
                      ),
                      Card(
                        
                        child: ListTile(
                          
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
           textColor: Colors.white,
           tileColor: Color.alphaBlend(Color.fromARGB(255, 41, 55, 124),  Color.fromRGBO(39, 115, 171, 1)),
                          title: Text( "Late Fees" ),
                               leading: Icon(Icons.not_started, color: Colors.white,),
                               trailing: Text(feeData.data!.row[index].lateFee.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
           textColor: Colors.white,
           tileColor: Color.alphaBlend(Color.fromARGB(255, 41, 55, 124),  Color.fromRGBO(39, 115, 171, 1)),
                          title: Text( "Total Fees" ),
                          leading: Icon(Icons.disc_full, color: Colors.white,),
                          trailing: Text( '${feestotal = feeData.data!.row[index].courseFee + feeData.data!.row[index].hostelFee + feeData.data!.row[index].lateFee}'),
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
