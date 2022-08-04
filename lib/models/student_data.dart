class StudentProfile {
  final id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String cms;

  StudentProfile(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.cms});

  factory StudentProfile.fromJson(Map<String, dynamic> json) {
    return StudentProfile(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      cms: json['cms'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['email'] = this.email;
  //   data['phone'] = this.phone;
  //   data['cms'] = this.cms;
  //   return data;
  // }
}
