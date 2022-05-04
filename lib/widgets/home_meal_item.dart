import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/models/meal.dart';
import 'package:tfos/screens/recomended_food_details_screen.dart';
import 'package:tfos/widgets/icon_and_text.dart';

class HomeMealItem extends StatelessWidget {
  const HomeMealItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, RecommendedFoodDetailsScreen.routeName,
                arguments: meal.id);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: 250,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(meal.image))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xffe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: const [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        // Icon(Icons.star),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('4.5'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('12 coments'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconAndText(
                      icon: Icons.circle,
                      title: 'Normal',
                    ),
                    IconAndText(
                      icon: Icons.location_on,
                      title: '1.7km',
                    ),
                    IconAndText(
                      icon: Icons.alarm,
                      title: '32min',
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
