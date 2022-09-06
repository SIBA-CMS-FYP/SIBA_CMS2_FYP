class AttendanceSubject {
  AttendanceSubject({
    required this.row,
  });
  late final List<Row> row;

  AttendanceSubject.fromJson(Map<String, dynamic> json) {
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
    required this.attendance,
    required this.Date,
  });
  late final int attendance;
  late final String Date;

  Row.fromJson(Map<String, dynamic> json) {
    attendance = json['attendance'];
    Date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attendance'] = attendance;
    _data['Date'] = Date;
    return _data;
  }
}
