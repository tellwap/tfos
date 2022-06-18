import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/models/cart.dart';
import 'package:tfos/providers/carts.dart';
import 'package:tfos/providers/meals.dart';
import 'package:tfos/widgets/icon_and_text.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/food-detail-screen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as int;
    final meal = Provider.of<Meals>(context)
        .items
        .firstWhere((meal) => meal.id == mealId);
    final cart = Provider.of<Carts>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          cart.addItem(
            meal.id,
            Cart(
                id: meal.id,
                productId: meal.id,
                quantity: 1,
                title: meal.name,
                price: meal.price,
                image: meal.image),
          );
        },
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: Center(
              child: Text(
            'Tsh ${meal.price} Add to cart',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(meal.image))),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(Icons.clear),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Icon(Icons.shopping_cart_outlined),
                )
              ],
            ),
          ),
          Positioned(
            top: 280,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('4.5'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('123 comments')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(title: 'Normal', icon: Icons.circle),
                      IconAndText(title: '1.7km', icon: Icons.location_on),
                      IconAndText(title: '32min', icon: Icons.alarm),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(meal.details)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
