import 'package:flutter/material.dart';
import 'package:tfos/categories/views/categories_screen.dart';
import 'package:tfos/products/views/products_screen.dart';
import 'package:tfos/purchase_product_screen.dart';
import 'package:tfos/screens/account_screen.dart';
import 'package:tfos/screens/manufactre_orders_screen.dart';
import 'package:tfos/units/views/units_screen.dart';

class ManufactureDashboardScreen extends StatelessWidget {
  const ManufactureDashboardScreen({Key? key}) : super(key: key);

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
                'Welcome Manufactor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildCard('Product', 'Manage Products',
                        icon: Icons.store, onTap: () {
                      Navigator.pushNamed(context, ProductsScreen.routeName);
                    }),
                  ),
                  Expanded(
                    child: _buildCard('Stock', 'Manage Stocks',
                        icon: Icons.store_rounded, onTap: () {
                      Navigator.pushNamed(
                          context, PurchaseProductScreen.routeName);
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildCard('Units', 'Manage units',
                        icon: Icons.subject, onTap: () {
                      Navigator.pushNamed(context, UnitsScreen.routeName);
                    }),
                  ),
                  Expanded(
                      child: _buildCard('Categories', 'Manage Category',
                          icon: Icons.category, onTap: () {
                    Navigator.pushNamed(context, CategoriesScreen.routeName);
                  })),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildCard('Orders', 'Manage orders',
                        icon: Icons.add_shopping_cart_sharp, onTap: () {
                      Navigator.pushNamed(
                          context, ManufactureOrdersScreen.routeName);
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
