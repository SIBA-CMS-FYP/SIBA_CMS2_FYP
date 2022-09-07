class LibraryModel {
  LibraryModel({
    required this.row,
  });
  late final List<Row> row;

  LibraryModel.fromJson(Map<String, dynamic> json) {
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
    required this.id,
    required this.BookIssue,
    required this.cms,
    required this.issueDate,
    required this.dueDate,
    required this.submitDate,
    required this.Due,
  });
  late final int id;
  late final String BookIssue;
  late final String cms;
  late final String issueDate;
  late final String dueDate;
  late final String submitDate;
  late final int Due;

  Row.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    BookIssue = json['Book_issue'];
    cms = json['cms'];
    issueDate = json['issue_date'];
    dueDate = json['due_date'];
    submitDate = json['submit_date'];
    Due = json['Due'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['Book_issue'] = BookIssue;
    _data['cms'] = cms;
    _data['issue_date'] = issueDate;
    _data['due_date'] = dueDate;
    _data['submit_date'] = submitDate;
    _data['Due'] = Due;
    return _data;
  }
}
