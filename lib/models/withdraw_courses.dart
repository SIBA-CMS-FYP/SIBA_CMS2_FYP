class WithdrawCourse {
  WithdrawCourse({
    required this.data,
  });
  late final List<Data> data;

  WithdrawCourse.fromJson(Map<String, dynamic> json) {
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
    required this.title,
    required this.courseCode,
    required this.teacherId,
    required this.enrollID,
    required this.cms,
    required this.isWithdraw,
    required this.isTeacherAcp,
    required this.isHODAcept,
  });
  late final String title;
  late final String courseCode;
  late final String teacherId;
  late final int enrollID;
  late final String cms;
  late final int isWithdraw;
  late final int isTeacherAcp;
  late final int isHODAcept;

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    courseCode = json['course_Code'];
    teacherId = json['teacher_id'];
    enrollID = json['enroll_ID'];
    cms = json['cms'];
    isWithdraw = json['isWithdraw'];
    isTeacherAcp = json['isTeacherAcp'];
    isHODAcept = json['isHODAcept'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['course_Code'] = courseCode;
    _data['teacher_id'] = teacherId;
    _data['enroll_ID'] = enrollID;
    _data['cms'] = cms;
    _data['isWithdraw'] = isWithdraw;
    _data['isTeacherAcp'] = isTeacherAcp;
    _data['isHODAcept'] = isHODAcept;
    return _data;
  }
}
