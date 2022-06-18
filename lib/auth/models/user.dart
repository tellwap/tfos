class User {
  final int id;
  final String name;
  final String email;
  final String role;
  final String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phoneNumber,
  });

  //function to convert json data to user object/model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      phoneNumber: json['phone_number'],
    );
  }
}
