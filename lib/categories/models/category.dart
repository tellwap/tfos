class Category {
  final int id;
  final String name;
  final String details;

  Category({required this.id, required this.name, required this.details});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'], name: json['name'], details: json['details']);
  }
}
