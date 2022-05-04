import 'package:flutter/foundation.dart';
import 'package:tfos/models/meal.dart';

class Meals with ChangeNotifier {
  final _items = [
    Meal(
      id: 1,
      name: 'Biriani1',
      details: 'Biriani details...',
      image: 'assets/images/food1.jpg',
      price: 10000,
    ),
    Meal(
      id: 2,
      name: 'Nyama Rosti',
      details: 'Nyama rost details...',
      image: 'assets/images/food2.jpg',
      price: 10000,
    ),
    Meal(
      id: 3,
      name: 'Chipsi Kuku',
      details: 'Chips kuku details...',
      image: 'assets/images/food3.jpg',
      price: 10000,
    ),
    Meal(
      id: 4,
      name: 'Ugali Nyama Choma',
      details: 'Nyama choma details...',
      image: 'assets/images/food4.jpg',
      price: 10000,
    ),
    Meal(
      id: 5,
      name: 'Samaki',
      details: 'samaki choma details...',
      image: 'assets/images/food5.jpg',
      price: 10000,
    ),
  ];

  List<Meal> get items {
    return [..._items];
  }
}
