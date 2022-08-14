import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/student_data.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  var cmss;
  Future<StudentProfile>? studentData;

  @override
  initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cmss = (prefs.getString('cms'));
      studentData = fetchStudent(cmss.toString());
      print(cmss);
    });
  }

  void savedata() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),   
        ),
      ),
      body: Center(
        child: FutureBuilder<StudentProfile>(
          future: studentData,
          builder: (context, profiledata) {
            if (profiledata.hasData) {
              var d=profiledata.data!;
              return
                   ProfileTemp(d.firstName, d.lastName, d.email, d.phone);
            } else if (profiledata.hasError) {
              return Text('${profiledata.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class ProfileTemp extends StatefulWidget {
  
  var firstName,lastName, email, phone;
  ProfileTemp(this.firstName, this.lastName, this.email, this.phone);

  @override
  State<ProfileTemp> createState() => _ProfileTempState();
}

class _ProfileTempState extends State<ProfileTemp> {

var cms1;
  @override
  void initState() {
    _loadCMS();
    super.initState();
  }

  Future<void> _loadCMS() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms1 = prefs.getString('cms');
    });
  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            
            color: Colors.white,
          ),
        ),
        
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  
                  Container(
                    height: height * 0.28,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: 40,
                             bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                               height: innerHeight * 0.5,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      colors: [
                                      Color.fromRGBO(4, 9, 35, 1),
                                      Color.fromRGBO(39, 105, 171, 1),
                                              ],
                                      begin: FractionalOffset.bottomCenter,
                                       end: FractionalOffset.topCenter,
                                ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      widget.firstName +" "+ widget.lastName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Nunito',
                                        fontSize: 30,
                                      ),
                                    ),
                               
                           Text(
                                      "CGPA:  ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Nunito',
                                        fontSize: 14,
                                      ),
                                    ),
                                    
                             
                                  ],
                                ),
                              ),
                            ),
                            
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                             
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/profile.png',
                                    width: innerWidth * 0.4,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                
                        
                           Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
                            
                            ),
                            child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                      
                          
                        children: [

                        
                          
                          SizedBox(
                                      height: 10,
                                    ),
                                    
  Icon(
    
   
                            CupertinoIcons.goforward,
                        color: Colors.white, 
                             size: 25,
                              ),
                          
                          Text(
                           " " +'${cms1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        
          
        
                          Divider(
                            thickness: 2.5,
                          ),
                       
                          
                         
                        ],
                        
                      ),
                    ),
                          ),
                          SizedBox(
                    height: 10,
                  ),
                   Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
                            
                            ),
                            child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                      
                          
                        children: [

                        
                          
                          SizedBox(
                                      height: 10,
                                    ),
                                    
  Icon(
    
   
                            CupertinoIcons.house,
                        color: Colors.white, 
                             size: 25,
                              ),
                          
                          Text(
                           " "+widget.email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        
          
        
                          Divider(
                            thickness: 2.5,
                          ),
                       
                          
                         
                        ],
                        
                      ),
                    ),
                          ),
                          SizedBox(
                    height: 10,
                  ),
                
                           Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
                            
                            ),
                            child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          SizedBox(
                                      height: 10,
                                    ),
                                    Icon(
    
   
                            CupertinoIcons.phone,
                        color: Colors.white, 
                             size: 25,
                              ),
                          Text(
                          " "+ widget.phone,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                       
                          
                         
                        ],
                      ),
                    ),
                          ),
                          SizedBox(
                    height: 10,
                  ),
                 Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
                            
                            ),
                            child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                      
                          
                        children: [

                        
                          
                          SizedBox(
                                      height: 10,
                                    ),
                                    
  Icon(
    
   
                            CupertinoIcons.book,
                        color: Colors.white, 
                             size: 25,
                              ),
                          
                          Text(
                           " Computer Science",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        
          
        
                          Divider(
                            thickness: 2.5,
                          ),
                       
                          
                         
                        ],
                        
                      ),
                    ),
                          ),
                          SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
          
                
  }
}