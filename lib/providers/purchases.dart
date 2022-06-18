import 'package:flutter/foundation.dart';
import 'package:tfos/models/purchase.dart';

class Purchases with ChangeNotifier {
  Map<String, Purchase> _items = {};

  Map<String, Purchase> get items {
    return {..._items};
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cart) {
      total += cart.totalPrice;
    });
    return total;
  }

  void addItem(int productId, Purchase purchase) {
    if (_items.containsKey(productId)) {
      //increase quantity
      _items.update(
          productId.toString(),
          (cart) => Purchase(
              id: cart.id,
              productId: productId,
              quantity: cart.quantity + 1,
              title: cart.title,
              price: cart.price,
              image: cart.image));
    } else {
      _items.putIfAbsent(productId.toString(), () => purchase);
    }
    print(_items);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
