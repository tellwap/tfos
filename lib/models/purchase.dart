import 'package:flutter/foundation.dart';

class Purchase with ChangeNotifier {
  final int id;
  final int productId;
  int quantity;
  final String title;
  final double price;
  final String image;

  Purchase({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.title,
    required this.price,
    required this.image,
  });

  double get totalPrice {
    var total = 0.0;
    total += quantity * price;
    return total;
  }

  void increaseQuantity() {
    quantity += 1;
    notifyListeners();
  }

  void decreaseQuantity() {
    quantity -= 1;
    notifyListeners();
  }
}
