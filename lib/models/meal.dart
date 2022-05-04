import 'package:flutter/foundation.dart';

class Meal with ChangeNotifier {
  final int id;
  final String name;
  final String details;
  final String image;
  final double price;

  Meal({
    required this.id,
    required this.name,
    required this.details,
    required this.image,
    required this.price,
  });
}
