import 'dart:convert';

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToMap(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  final String firstName;
  final String lastName;
  //final int empid;
  final String email;
  final String password;

  User({
    required this.firstName,
    required this.lastName,
    // required this.empid,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        // empid: json["empid"],
        email: json["email_id"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        // "empid": empid,
        "email_id": email,
        "password": password,
      };

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, email: $email, password: $password}';
  }
}
