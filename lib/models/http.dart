import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:siba_cms_2/models/student_data.dart';

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "localhost:3000";

List<StudentProfile> _item = [];
Future<RequestResult> http_get(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(Uri.parse(url));
  return RequestResult(true, jsonDecode(result.body));
}

Future<void> fetchStudent(String cms) async {
  var url = "http://localhost:3000/getstudent/?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<StudentProfile> loadedProducts = [];
    extractedData.forEach((id, prodData) {
      loadedProducts.add(StudentProfile(
          id: id,
          firstName: prodData["firstName"],
          lastName: prodData['lastName'],
          email: prodData['email'],
          phone: prodData['phone'],
          cms: cms));
    });
    _item = loadedProducts;
    print(_item.length);
    // return StudentProfile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<StudentProfile> fetchResult(String cms) async {
  var url = "http://localhost:3000/getstudent/?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return StudentProfile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<StudentProfile> fetchTerms(String cms) async {
  var url = "http://localhost:3000/getstudent/?cms=$cms";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return StudentProfile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}
// Future<RequestResult> http_post(String route, [dynamic data]) async {
//   var url = "$PROTOCOL://$DOMAIN/$route";
//   var dataStr = jsonEncode(data);
//   var result = await http
//       .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
//   return RequestResult(true, jsonDecode(result.body));
// }
