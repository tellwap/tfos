import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/carts.dart';
import 'package:tfos/providers/meals.dart';
import 'package:tfos/providers/orders.dart';
import 'package:tfos/screens/bottom_navigation_screen.dart';
import 'package:tfos/screens/food_details_screen.dart';
import 'package:tfos/screens/recomended_food_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Meals()),
        ChangeNotifierProvider(create: (ctx) => Carts()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const BottomNavigationScreen(),
        routes: {
          FoodDetailsScreen.routeName: (ctx) => const FoodDetailsScreen(),
          RecommendedFoodDetailsScreen.routeName: (ctx) =>
              const RecommendedFoodDetailsScreen(),
        },
      ),
    );
  }
}
