class StudentAttendance {
  StudentAttendance({
    required this.data,
  });
  late final List<Data> data;

  StudentAttendance.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.CourseTitle,
    required this.courseCode,
    required this.Present,
    required this.Absent,
  });
  late final String CourseTitle;
  late final int courseCode;
  late final int Present;
  late final int Absent;

  Data.fromJson(Map<String, dynamic> json) {
    CourseTitle = json['Course_title'];
    courseCode = json['courseCode'];
    Present = json['Present'];
    Absent = json['Absent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Course_title'] = CourseTitle;
    _data['courseCode'] = courseCode;
    _data['Present'] = Present;
    _data['Absent'] = Absent;
    return _data;
  }
}
