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
    required this.courseId,
    required this.teacherId,
    required this.enrollID,
    required this.cms,
  });
  late final String title;
  late final String courseId;
  late final String teacherId;
  late final int enrollID;
  late final String cms;

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    courseId = json['course_id'];
    teacherId = json['teacher_id'];
    enrollID = json['enroll_ID'];
    cms = json['cms'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['course_id'] = courseId;
    _data['teacher_id'] = teacherId;
    _data['enroll_ID'] = enrollID;
    _data['cms'] = cms;
    return _data;
  }
}
