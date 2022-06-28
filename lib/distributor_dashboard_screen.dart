import 'package:flutter/material.dart';
import 'package:tfos/retailer_product_screen.dart';
import 'package:tfos/screens/account_screen.dart';
import 'package:tfos/screens/distributor_orders_screen.dart';
import 'package:tfos/screens/orders_screen.dart';

class DistributorDashboardScreen extends StatelessWidget {
  const DistributorDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildCard(String title, String subtitle,
        {required VoidCallback onTap, IconData? icon = Icons.settings}) {
      return InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(subtitle),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                'Welcome Distributor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildCard('Orders', 'Assigned Orders',
                        icon: Icons.add_shopping_cart_rounded, onTap: () {
                      Navigator.pushNamed(
                          context, DistributorOrdersScreen.routeName);
                    }),
                  ),
                  Expanded(
                      child: _buildCard('Accounts', 'Manage Account',
                          icon: Icons.person, onTap: () {
                    Navigator.pushNamed(context, AccountScreen.routeName);

                    // Navigator.pushNamed(context, CategoriesScreen.routeName);
                  })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
