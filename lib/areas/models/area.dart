class Area {
  final int id;
  final String name;
  final String code;

  Area({required this.id, required this.name, required this.code});
  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(id: json['id'], name: json['name'], code: json['code']);
  }
}
