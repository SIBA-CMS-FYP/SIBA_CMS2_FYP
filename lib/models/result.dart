class Result {
  Result({
    required this.Course,
    required this.firstMid,
    required this.secondMid,
    required this.sessional,
    required this.finalExam,
    required this.GPA,
    required this.CGPA,
  });
  late final String Course;
  late final double firstMid;
  late final int secondMid;
  late final int sessional;
  late final int finalExam;
  late final int GPA;
  late final int CGPA;

  Result.fromJson(Map<String, dynamic> json) {
    Course = json['Course'];
    firstMid = json['firstMid'];
    secondMid = json['secondMid'];
    sessional = json['sessional'];
    finalExam = json['final'];
    GPA = json['GPA'];
    CGPA = json['CGPA'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Course'] = Course;
    _data['firstMid'] = firstMid;
    _data['secondMid'] = secondMid;
    _data['sessional'] = sessional;
    _data['final'] = finalExam;
    _data['GPA'] = GPA;
    _data['CGPA'] = CGPA;
    return _data;
  }
}
