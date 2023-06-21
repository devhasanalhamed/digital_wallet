class UserModel {
  String firstName;
  String fatherName;
  String grandFatherName;
  String lastName;
  String phoneNumber;
  String password;
  DateTime? dateOfBirth;
  String jobTitle;

  UserModel({
    required this.firstName,
    required this.fatherName,
    required this.grandFatherName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.dateOfBirth,
    required this.jobTitle,
  });
}
