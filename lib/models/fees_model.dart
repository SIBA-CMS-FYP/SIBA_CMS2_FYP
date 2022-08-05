class StudentFees {
  StudentFees({
    required this.row,
  });
  late final List<Row> row;

  StudentFees.fromJson(Map<String, dynamic> json) {
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
    required this.finaceId,
    required this.courseFee,
    required this.hostelFee,
    required this.lateFee,
    required this.cms,
    required this.enrollId,
  });
  late final int finaceId;
  late final int courseFee;
  late final int hostelFee;
  late final int lateFee;
  late final String cms;
  late final int enrollId;

  Row.fromJson(Map<String, dynamic> json) {
    finaceId = json['finace_id'];
    courseFee = json['course_fee'];
    hostelFee = json['hostel_fee'];
    lateFee = json['late_fees'];
    cms = json['cms'];
    enrollId = json['enroll_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['finace_id'] = finaceId;
    _data['course_fee'] = courseFee;
    _data['hostel_fee'] = hostelFee;
    _data['late_fees'] = lateFee;
    _data['cms'] = cms;
    _data['enroll_id'] = enrollId;
    return _data;
  }
}
