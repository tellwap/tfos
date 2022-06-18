class Orderr {
  final int id;
  final int approved;
  final int status;
  final int totalAmount;

  Orderr({
    required this.id,
    required this.approved,
    required this.status,
    required this.totalAmount,
  });

  factory Orderr.fromJson(Map<String, dynamic> json) {
    return Orderr(
      id: json['id'],
      approved: json['approved'],
      status: json['status'],
      totalAmount: json['total_amount'],
    );
  }
}
