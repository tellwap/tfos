import 'package:flutter/material.dart';
import 'package:tfos/areas/views/areas_screen.dart';
import 'package:tfos/categories/views/categories_screen.dart';
import 'package:tfos/distributors/views/distributors_screen.dart';
import 'package:tfos/manufactures/views/manufactures_screen.dart';
import 'package:tfos/products/views/products_screen.dart';
import 'package:tfos/retailers/views/retailers_screen.dart';
import 'package:tfos/screens/account_screen.dart';
import 'package:tfos/units/views/units_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

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
                  size: 40,
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
                'Welcome Admin',
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
                    child: _buildCard('Retailes', 'Manage Retailers',
                        icon: Icons.person_add, onTap: () {
                      Navigator.pushNamed(context, RetailersScreen.routeName);
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
                    child: _buildCard('Manufacture', 'manufactures',
                        icon: Icons.person_add, onTap: () {
                      Navigator.pushNamed(
                          context, ManufacturesScreen.routeName);
                    }),
                  ),
                  Expanded(
                    child: _buildCard('Distributors', 'Manage Distributors',
                        icon: Icons.person_add, onTap: () {
                      Navigator.pushNamed(
                          context, DistributorsScreen.routeName);
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
                        icon: Icons.manage_search_sharp, onTap: () {
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
                    child: _buildCard('Area', 'Manage areas', icon: Icons.place,
                        onTap: () {
                      Navigator.pushNamed(context, AreasScreen.routeName);
                    }),
                  ),
                  Expanded(
                      child: _buildCard('Accounts', 'Manage Account',
                          icon: Icons.person, onTap: () {
                    Navigator.pushNamed(context, AccountScreen.routeName);
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
