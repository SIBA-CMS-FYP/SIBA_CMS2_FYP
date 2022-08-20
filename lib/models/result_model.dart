class StudentResults {
  StudentResults({
    required this.row,
  });
  late final List<Row> row;

  StudentResults.fromJson(Map<String, dynamic> json) {
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
    required this.Course,
    required this.firstMid,
    required this.secondMid,
    required this.sessional,
    required this.finalExam,
    required this.GPA,
    required this.CGPA,
  });
  late final String Course;
  late final double? firstMid;
  late final double? secondMid;
  late final double? sessional;
  late final double? finalExam;
  late final double? GPA;
  late final double? CGPA;

  Row.fromJson(Map<String, dynamic> json) {
    Course = json['Course'];
    firstMid = (json['firstMid'] as num).toDouble();
    secondMid = (json['secondMid'] as num).toDouble();
    sessional = (json['sessional'] as num).toDouble();
    finalExam = (json['finalExam'] as num).toDouble();
    GPA = (json['GPA'] as num).toDouble();
    CGPA = (json['CGPA'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Course'] = Course;
    _data['firstMid'] = firstMid;
    _data['secondMid'] = secondMid;
    _data['sessional'] = sessional;
    _data['finalExam'] = finalExam;
    _data['GPA'] = GPA;
    _data['CGPA'] = CGPA;
    return _data;
  }
}
