class StudentAttendance {
  StudentAttendance({
    required this.row,
  });
  late final List<Row> row;

  StudentAttendance.fromJson(Map<String, dynamic> json) {
    row = List.from(json['row']).map((e) => Row.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['row'] = row.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Row {
  Row({
    required this.CourseTitle,
    required this.courseCode,
    required this.Present,
    required this.Absent,
  });
  late final String CourseTitle;
  late final int courseCode;
  late final int Present;
  late final int Absent;

  Row.fromJson(Map<String, dynamic> json) {
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
