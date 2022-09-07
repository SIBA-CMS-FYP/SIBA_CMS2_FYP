import 'dart:ffi';

class StudentProfile {
  final id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String cms;
  final double CGPA;

  StudentProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.cms,
    required this.CGPA,
  });

  factory StudentProfile.fromJson(Map<String, dynamic> json) {
    return StudentProfile(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      cms: json['cms'],
      CGPA: (json['CGPA'] as num) as double,
    );
  }
}
