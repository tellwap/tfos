import 'package:flutter/foundation.dart';
import 'package:tfos/models/cart.dart';
import 'package:tfos/models/order.dart';

class Orders with ChangeNotifier {
  List<Order> _items = [];
  List<Order> get items {
    return [..._items];
  }

  void addOrder(List<Cart> cartProducts, double total) {
    _items.insert(
        0,
        Order(
          id: 1,
          amount: total,
          products: cartProducts,
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }
}
