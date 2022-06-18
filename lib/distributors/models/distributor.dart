class Distributor {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  Distributor({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });
  factory Distributor.fromJson(Map<String, dynamic> json) {
    return Distributor(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        address: json['address']);
  }
}
