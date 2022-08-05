class StudentTerms {
  StudentTerms({
    required this.row,
  });
  late final List<Row> row;

  StudentTerms.fromJson(Map<String, dynamic> json) {
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
    required this.enrollID,
    required this.season,
    required this.year,
  });
  late final int enrollID;
  late final String season;
  late final int year;

  Row.fromJson(Map<String, dynamic> json) {
    enrollID = json['enroll_ID'];
    season = json['season'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['enroll_ID'] = enrollID;
    _data['season'] = season;
    _data['year'] = year;
    return _data;
  }
}
