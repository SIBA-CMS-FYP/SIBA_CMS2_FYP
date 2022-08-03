class Attendance {
  Attendance({
    required this.attendanceId,
    required this.attendance,
    required this.courseId,
    required this.cms,
    required this.enrollId,
    required this.date,
    required this.time,
  });
  late final int attendanceId;
  late final Attendance attendance;
  late final String courseId;
  late final String cms;
  late final int enrollId;
  late final String date;
  late final String time;

  Attendance.fromJson(Map<String, dynamic> json) {
    attendanceId = json['attendance_id'];
    attendance = Attendance.fromJson(json['attendance']);
    courseId = json['course_id'];
    cms = json['cms'];
    enrollId = json['enroll_id'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attendance_id'] = attendanceId;
    _data['attendance'] = attendance.toJson();
    _data['course_id'] = courseId;
    _data['cms'] = cms;
    _data['enroll_id'] = enrollId;
    _data['date'] = date;
    _data['time'] = time;
    return _data;
  }
}

class AttendanceS {
  AttendanceS({
    required this.type,
    required this.data,
  });
  late final String type;
  late final List<int> data;

  AttendanceS.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = List.castFrom<dynamic, int>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['data'] = data;
    return _data;
  }
}
