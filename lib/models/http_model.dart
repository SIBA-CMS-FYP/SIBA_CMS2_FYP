import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siba_cms_2/models/attendance_Model.dart';
import 'package:siba_cms_2/models/current_semester.dart';
import 'package:siba_cms_2/models/fees_model.dart';
import 'package:siba_cms_2/models/library_model.dart';
import 'package:siba_cms_2/models/result_model.dart';
import 'package:siba_cms_2/models/semester_terms.dart';
import 'package:siba_cms_2/models/courses_model.dart';
import 'package:siba_cms_2/models/student_data.dart';
import 'package:siba_cms_2/models/sub_attendance.dart';
import 'package:siba_cms_2/models/withdraw_courses.dart';

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "192.168.220.60:8080";

Future<StudentProfile> fetchStudent(String cms) async {
  var url = "$PROTOCOL://$DOMAIN/getstudent/?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return StudentProfile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<StudentFees> fetchFees(String cms) async {
  var url = "$PROTOCOL://$DOMAIN/user/getfinance?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return StudentFees.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<StudentTerms> fetchTerms(String cms) async {
  var url = "$PROTOCOL://$DOMAIN/terms/getTerms?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return StudentTerms.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<StudentCourses> fetchCourses(String cms, int enrollID) async {
  var url = "$PROTOCOL://$DOMAIN/getCourse?cms=$cms&enroll_id=$enrollID";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return StudentCourses.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load data");
  }
}

Future<StudentResults> fetchResult(String cms, var enrollID) async {
  var url = "$PROTOCOL://$DOMAIN/result/getResult?cms=$cms&enroll_id=$enrollID";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print(json.decode(response.body));
    return StudentResults.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load data");
  }
}

void fetchEnroll(String cms) async {
  var url = "$PROTOCOL://$DOMAIN/getCurrent/enrollID?cms=$cms";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    final pref = await SharedPreferences.getInstance();
    pref.setInt("enrollID", data);
  } else {
    throw Exception("Failed to load data");
  }
}

Future<CurrentSemester> fetchCurrent(String cms) async {
  var url = "$PROTOCOL://$DOMAIN/getCurrent/Semester?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return CurrentSemester.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load data");
  }
}

Future<WithdrawCourse> fetch_C_W(String cms) async {
  var url = "$PROTOCOL://$DOMAIN/getCurrent/forWithdraw?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return WithdrawCourse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load data");
  }
}

Future<RequestResult> withdrawReq(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/withdraw/sendWithdrawReq?";
  var dataStr = jsonEncode(data);
  var result = await http.post(Uri.parse(url),
      body: dataStr, headers: {"Content-Type": "application/json"});
  return RequestResult(true, jsonDecode(result.body));
}

Future<StudentAttendance> fetchAttendance(String cms, var enroll_id) async {
  var url =
      "$PROTOCOL://$DOMAIN/attendance/userAttendance?cms=$cms&enroll_id=$enroll_id";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return StudentAttendance.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Faild To 'Load attendance ");
  }
}

Future<AttendanceSubject> fetchAttendanceBySubj(
  var cms,
  var enroll_id,
  var course_code,
) async {
  print(course_code);
  var url =
      "$PROTOCOL://$DOMAIN/attendance/bySubAttendance?cms=$cms&enroll_id=$enroll_id&course_Code=$course_code";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return AttendanceSubject.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Faild To 'Load attendance ");
  }
}

Future<LibraryModel> fetchLibDue(var cms) async {
  var url = "$PROTOCOL://$DOMAIN/library/getLibrary?cms=$cms";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return LibraryModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Faild To 'Load Library data ");
  }
}
