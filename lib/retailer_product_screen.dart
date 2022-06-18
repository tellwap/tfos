import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/models/cart.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:tfos/products/view_models/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/carts.dart';
import 'package:tfos/screens/cart_screen.dart';

class RetailerProductScreen extends StatelessWidget {
  const RetailerProductScreen({Key? key}) : super(key: key);
  static const routeName = '/retailer-products-screen';

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    final cart = Provider.of<Carts>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: _ui(productViewModel, cart),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  _ui(ProductViewModel productViewModel, Carts cart) {
    if (productViewModel.loading) {
      return const AppLoading();
    }

    if (productViewModel.productError != null) {
      return AppError(
        errorMessage: '${productViewModel.productError?.message}',
      );
    }

    return ListView.builder(
      itemCount: productViewModel.products.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: Container(
              height: 150,
              width: 100,
              color: Colors.grey,
            ),
            title: Text(
              productViewModel.products[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productViewModel.products[index].price} TSH',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(productViewModel.products[index].description)
              ],
            ),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () {
              cart.addItem(
                productViewModel.products[index].id,
                Cart(
                    id: 1,
                    quantity: 1,
                    productId: productViewModel.products[index].id,
                    title: productViewModel.products[index].name,
                    price: productViewModel.products[index].price as double,
                    image: productViewModel.products[index].name),
              );
              ScaffoldMessenger.of(ctx)
                  .showSnackBar(const SnackBar(content: Text('Added to cart')));
              // productViewModel
              //     .setSelectedProduct(productViewModel.products[index]);
              // Navigator.pushNamed(ctx, ProductDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
