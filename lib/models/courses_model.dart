class StudentCourses {
  StudentCourses({
    required this.row,
  });
  late final List<Row> row;

  StudentCourses.fromJson(Map<String, dynamic> json) {
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
    required this.title,
    required this.cms,
    required this.enrollId,
  });
  late final String title;
  late final String cms;
  late final int enrollId;

  Row.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cms = json['cms'];
    enrollId = json['enroll_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['cms'] = cms;
    _data['enroll_id'] = enrollId;
    return _data;
  }
}
