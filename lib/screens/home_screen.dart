import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/meals.dart';
import 'package:tfos/widgets/home_meal_item.dart';
import 'package:tfos/widgets/popular_meal_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(viewportFraction: 0.85);
    final meals = Provider.of<Meals>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodApp'),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //container to show the home meal card
                  SizedBox(
                    height: 320,
                    // color: Colors.red,
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: meals.length,
                        itemBuilder: (ctx, position) =>
                            ChangeNotifierProvider.value(
                                value: meals[position],
                                // create: (ctx) => meals[position],
                                child: const HomeMealItem())),
                  ),

                  //container to show popula meal
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: const Text(
                      'Popular',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 700,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: meals.length,
                        itemBuilder: (ctx, index) =>
                            ChangeNotifierProvider.value(
                              value: meals[index],
                              child: const PopularMealItem(),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
