class CurrentSemester {
  CurrentSemester({
    required this.row,
  });
  late final List<Row> row;

  CurrentSemester.fromJson(Map<String, dynamic> json) {
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
    required this.enrollID,
    required this.cms,
  });
  late final String title;
  late final int enrollID;
  late final String cms;

  Row.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    enrollID = json['enroll_ID'];
    cms = json['cms'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['enroll_ID'] = enrollID;
    _data['cms'] = cms;
    return _data;
  }
}
