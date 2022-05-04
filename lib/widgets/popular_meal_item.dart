import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/models/meal.dart';
import 'package:tfos/screens/food_details_screen.dart';
import 'package:tfos/widgets/icon_and_text.dart';

class PopularMealItem extends StatelessWidget {
  const PopularMealItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(FoodDetailsScreen.routeName, arguments: meal.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        // color: Colors.red,
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(meal.image)),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 5),
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      meal.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(meal.details),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconAndText(title: 'Normal', icon: Icons.circle),
                          IconAndText(title: '17 km', icon: Icons.location_on),
                          IconAndText(title: '32 min', icon: Icons.alarm),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
