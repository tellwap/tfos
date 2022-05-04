import 'package:flutter/foundation.dart';
import 'package:tfos/models/cart.dart';

class Carts with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cart) {
      total += cart.totalPrice;
    });
    return total;
  }

  void addItem(int productId, Cart cart) {
    if (_items.containsKey(productId)) {
      //increase quantity
      _items.update(
          productId.toString(),
          (cart) => Cart(
              id: cart.id,
              quantity: cart.quantity + 1,
              title: cart.title,
              price: cart.price,
              image: cart.image));
    } else {
      _items.putIfAbsent(productId.toString(), () => cart);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
