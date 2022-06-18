class Unit {
  final int id;
  final String name;
  final String details;

  Unit({required this.id, required this.name, required this.details});
  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(id: json['id'], name: json['name'], details: json['details']);
  }
}
