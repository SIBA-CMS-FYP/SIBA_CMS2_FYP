class StudentProfile {
  StudentProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.cms,
    required this.CGPA,
    required this.img,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String cms;
  late final double CGPA;
  late final String img;

  StudentProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    cms = json['cms'];
    CGPA = json['CGPA'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['cms'] = cms;
    _data['CGPA'] = CGPA;
    _data['img'] = img;
    return _data;
  }
}
