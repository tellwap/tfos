import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/admin_dashboard_screen.dart';
import 'package:tfos/areas/view_models/area_view_model.dart';
import 'package:tfos/areas/views/add_area_screen.dart';
import 'package:tfos/areas/views/area_details_screen.dart';
import 'package:tfos/areas/views/areas_screen.dart';
import 'package:tfos/areas/views/edit_area_screen.dart';
import 'package:tfos/auth/auths.dart';
import 'package:tfos/auth/login_screen.dart';
import 'package:tfos/categories/view_models/category_view_model.dart';
import 'package:tfos/categories/views/add_category_screen.dart';
import 'package:tfos/categories/views/categories_screen.dart';
import 'package:tfos/categories/views/category_details_screen.dart';
import 'package:tfos/categories/views/edit_category_screen.dart';
import 'package:tfos/components/splash_screen.dart';
import 'package:tfos/distributors/view_models/distributor_view_model.dart';
import 'package:tfos/distributors/views/add_distributor_screen.dart';
import 'package:tfos/distributors/views/distributor_details_screen.dart';
import 'package:tfos/distributors/views/distributors_screen.dart';
import 'package:tfos/distributors/views/edit_distributor_screen.dart';
import 'package:tfos/manufacture_dashboard_screen.dart';
import 'package:tfos/manufactures/view_models/manufacture_view_model.dart';
import 'package:tfos/manufactures/views/add_manufacture_screen.dart';
import 'package:tfos/manufactures/views/edit_manufacture_screen.dart';
import 'package:tfos/manufactures/views/manufacture_details_screen.dart';
import 'package:tfos/manufactures/views/manufactures_screen.dart';
import 'package:tfos/products/view_models/product_view_model.dart';
import 'package:tfos/products/views/add_product_screen.dart';
import 'package:tfos/products/views/edit_product_screen.dart';
import 'package:tfos/products/views/product_details_screen.dart';
import 'package:tfos/products/views/products_screen.dart';
import 'package:tfos/providers/purchases.dart';
import 'package:tfos/providers/stocks.dart';
import 'package:tfos/purchase_product_screen.dart';
import 'package:tfos/retailer_product_screen.dart';
import 'package:tfos/retailers/view_models/retailer_view_model.dart';
import 'package:tfos/retailers/views/add_retailer_screen.dart';
import 'package:tfos/retailers/views/edit_retailer_screen.dart';
import 'package:tfos/retailers/views/retailer_details_screen.dart';
import 'package:tfos/retailers/views/retailers_screen.dart';
import 'package:tfos/retails_dashboard_screen.dart';
import 'package:tfos/screens/account_screen.dart';
import 'package:tfos/screens/cart_screen.dart';
import 'package:tfos/screens/manufactre_orders_screen.dart';
import 'package:tfos/screens/orders_screen.dart';
import 'package:tfos/screens/purchase_cart_screen.dart';
import 'package:tfos/units/views/add_unit_screen.dart';
import 'package:tfos/units/view_models/unit_view_model.dart';
import 'package:tfos/units/views/edit_unit_screen.dart';
import 'package:tfos/units/views/unit_details_screen.dart';
import 'package:tfos/units/views/units_screen.dart';
import 'package:tfos/providers/carts.dart';
import 'package:tfos/providers/meals.dart';
import 'package:tfos/providers/orders.dart';
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
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProvider(create: (ctx) => Meals()),
        ChangeNotifierProvider(create: (ctx) => Carts()),
        ChangeNotifierProvider(create: (ctx) => Purchases()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
        ChangeNotifierProvider(create: (ctx) => Stocks()),
        ChangeNotifierProvider(create: (ctx) => UnitViewModel()),
        ChangeNotifierProvider(create: (ctx) => CategoryViewModel()),
        ChangeNotifierProvider(create: (ctx) => AreaViewModel()),
        ChangeNotifierProvider(create: (ctx) => ProductViewModel()),
        ChangeNotifierProvider(create: (ctx) => RetailerViewModel()),
        ChangeNotifierProvider(create: (ctx) => ManufactureViewModel()),
        ChangeNotifierProvider(create: (ctx) => DistributorViewModel()),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, ch) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: auth.isAuth
              ? Builder(builder: (ctx) {
                  print(auth.user?.role);
                  if (auth.user?.role == 'admin') {
                    return const AdminDashboardScreen();
                  } else if (auth.user?.role == 'retailer') {
                    return const RetailsDashboardScreen();
                  } else if (auth.user?.role == 'manufacture') {
                    return const ManufactureDashboardScreen();
                  } else {
                    return const AdminDashboardScreen();
                  }
                })
              : FutureBuilder<Object>(
                  future: auth.tryAutoLogin(),
                  builder: (context, authSnapshot) =>
                      authSnapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const LoginScreen()),
          routes: {
            FoodDetailsScreen.routeName: (ctx) => const FoodDetailsScreen(),
            RecommendedFoodDetailsScreen.routeName: (ctx) =>
                const RecommendedFoodDetailsScreen(),

            //admin
            // AddCategoryScreen.routeName: (ctx) => const AddCategoryScreen(),
            // CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),

            //units
            UnitsScreen.routeName: (ctx) => const UnitsScreen(),
            AddUnitScreen.routeName: (ctx) => const AddUnitScreen(),
            EditUnitScreen.routeName: (ctx) => const EditUnitScreen(),
            UnitDetailsScreen.routeName: (ctx) => const UnitDetailsScreen(),

            //categories
            CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
            AddCategoryScreen.routeName: (ctx) => const AddCategoryScreen(),
            EditCategoryScreen.routeName: (ctx) => const EditCategoryScreen(),
            CategoryDetailsScreen.routeName: (ctx) =>
                const CategoryDetailsScreen(),

            //Areas
            AreasScreen.routeName: (ctx) => const AreasScreen(),
            AddAreaScreen.routeName: (ctx) => const AddAreaScreen(),
            EditAreaScreen.routeName: (ctx) => const EditAreaScreen(),
            AreaDetailsScreen.routeName: (ctx) => const AreaDetailsScreen(),

            //Areas
            ProductsScreen.routeName: (ctx) => const ProductsScreen(),
            AddProductScreen.routeName: (ctx) => const AddProductScreen(),
            EditProductScreen.routeName: (ctx) => const EditProductScreen(),
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),

            //Retailer
            RetailersScreen.routeName: (ctx) => const RetailersScreen(),
            AddRetailerScreen.routeName: (ctx) => const AddRetailerScreen(),
            EditRetailerScreen.routeName: (ctx) => const EditRetailerScreen(),
            RetailerDetailsScreen.routeName: (ctx) =>
                const RetailerDetailsScreen(),

            //Manufacture
            ManufacturesScreen.routeName: (ctx) => const ManufacturesScreen(),
            AddManufactureScreen.routeName: (ctx) =>
                const AddManufactureScreen(),
            EditManufactureScreen.routeName: (ctx) =>
                const EditManufactureScreen(),
            ManufactureDetailsScreen.routeName: (ctx) =>
                const ManufactureDetailsScreen(),

            //Distributor
            DistributorsScreen.routeName: (ctx) => const DistributorsScreen(),
            AddDistributorScreen.routeName: (ctx) =>
                const AddDistributorScreen(),
            EditDistributorScreen.routeName: (ctx) =>
                const EditDistributorScreen(),
            DistributorDetailsScreen.routeName: (ctx) =>
                const DistributorDetailsScreen(),
//accounts
            AccountScreen.routeName: (ctx) => const AccountScreen(),
            OrdersScreen.routeName: (ctx) => const OrdersScreen(),
            RetailerProductScreen.routeName: (ctx) =>
                const RetailerProductScreen(),

            CartScreen.routeName: (ctx) => const CartScreen(),
            ManufactureOrdersScreen.routeName: (ctx) =>
                const ManufactureOrdersScreen(),
            PurchaseProductScreen.routeName: (ctx) =>
                const PurchaseProductScreen(),
            PurchaseCartScreen.routeName: (ctx) => const PurchaseCartScreen(),
          },
        ),
      ),
    );
  }
}
