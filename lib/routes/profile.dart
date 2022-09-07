import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/components/constants.dart';
import 'package:siba_cms_2/models/http_model.dart';
import 'package:siba_cms_2/models/student_data.dart';

import 'package:widget_circular_animator/widget_circular_animator.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  var cms;
  Future<StudentProfile>? studentData;

  @override
  initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cms = (prefs.getString('cms'));
      studentData = fetchStudent(cms.toString());
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
        backgroundColor: myColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<StudentProfile>(
          future: studentData,
          builder: (context, profiledata) {
            if (profiledata.hasData) {
              var d = profiledata.data!;
              return ProfileTemp(
                  d.firstName, d.lastName, d.email, d.phone, d.CGPA);
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

// ignore: must_be_immutable
class ProfileTemp extends StatefulWidget {
  var firstName, lastName, email, phone, CGPA;
  ProfileTemp(this.firstName, this.lastName, this.email, this.phone, this.CGPA,
      {Key? key})
      : super(key: key);

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
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: 150,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 0.5,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: cardColor,
                                    begin: FractionalOffset.bottomCenter,
                                    end: FractionalOffset.topCenter,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      widget.firstName + " " + widget.lastName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Nunito',
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      "CGPA:    " + '${widget.CGPA}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 20,
                              right: 20,
                              bottom: 70,
                              child: Center(
                                child: WidgetCircularAnimator(
                                  size: 210,
                                  innerIconsSize: 2,
                                  outerIconsSize: 2,
                                  innerAnimation: Curves.easeInOutBack,
                                  outerAnimation: Curves.easeInOutBack,
                                  innerColor: Colors.deepPurple,
                                  outerColor: Colors.orangeAccent,
                                  innerAnimationSeconds: 10,
                                  outerAnimationSeconds: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[200]),
                                    child: Image.asset(
                                        "assets/images/iba_logo.png"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: cardColor,
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            CupertinoIcons.goforward,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            " " + '$cms1',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          const Divider(
                            thickness: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: cardColor,
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            CupertinoIcons.house,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            " " + widget.email,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          const Divider(
                            thickness: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: cardColor,
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            CupertinoIcons.phone,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            " " + widget.phone,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          const Divider(
                            thickness: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: cardColor,
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: const [
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
                  const SizedBox(
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
