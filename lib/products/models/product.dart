//['name','category_id','unit_id','price','quantity','stock','description']
import 'package:tfos/categories/models/category.dart';
import 'package:tfos/units/models/unit.dart';

class Product {
  final int id;
  final String name;
  String? image;
  int? categoryId;
  int? unitId;
  double? price;
  int? quantity;
  int? stock;
  final String description;
  Category? category;
  Unit? unit;

  Product(
      {required this.id,
      required this.name,
      this.categoryId,
      this.unitId,
      this.price,
      this.quantity,
      this.stock,
      required this.description,
      this.category,
      this.image,
      this.unit});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      //categoryId: json['category_id'],
      //unitId: json['unit_id'],
      price: double.parse(json['price'].toString()),
      quantity: json['quantity'],
      //stock: json['stock'],
      description: json['description'],
      unit: Unit.fromJson(json['unit']),
      category: Category.fromJson(json['category']),
    );
  }
}
