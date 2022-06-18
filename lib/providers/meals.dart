import 'package:flutter/foundation.dart';
import 'package:tfos/models/meal.dart';

class Meals with ChangeNotifier {
  final _items = [
    Meal(
      id: 1,
      name: 'Donut',
      details: 'Donut details...',
      image: 'assets/images/f2.jpg',
      price: 5000,
    ),
    Meal(
      id: 2,
      name: 'Bread',
      details: 'Bread details...',
      image: 'assets/images/f1.jpg',
      price: 10000,
    ),
    Meal(
      id: 3,
      name: 'Cakes',
      details: 'Cakes details...',
      image: 'assets/images/f3.jpg',
      price: 10000,
    ),
    // Meal(
    //   id: 4,
    //   name: 'Ugali Nyama Choma',
    //   details: 'Nyama choma details...',
    //   image: 'assets/images/food4.jpg',
    //   price: 10000,
    // ),
    // Meal(
    //   id: 5,
    //   name: 'Samaki',
    //   details: 'samaki choma details...',
    //   image: 'assets/images/food5.jpg',
    //   price: 10000,
    // ),
  ];

  List<Meal> get items {
    return [..._items];
  }
}
