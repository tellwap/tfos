import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:tfos/models/purchase.dart';
import 'package:tfos/products/view_models/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/purchases.dart';
import 'package:tfos/screens/purchase_cart_screen.dart';

class PurchaseProductScreen extends StatelessWidget {
  const PurchaseProductScreen({Key? key}) : super(key: key);
  static const routeName = '/purchase-products-screen';

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    final purchase = Provider.of<Purchases>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: _ui(productViewModel, purchase),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await Navigator.pushNamed(context, PurchaseCartScreen.routeName);
          if (result == null) {
            await Provider.of<ProductViewModel>(context, listen: false)
                .getProducts();
          }
        },
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  _ui(ProductViewModel productViewModel, Purchases purchases) {
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
                  '${productViewModel.products[index].quantity} ${productViewModel.products[index].unit?.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // Text(productViewModel.products[index].description)
              ],
            ),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () {
              purchases.addItem(
                productViewModel.products[index].id,
                Purchase(
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
