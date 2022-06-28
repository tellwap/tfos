import 'package:flutter/material.dart';
import 'package:tfos/products/views/add_product_screen.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:tfos/products/view_models/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/products/views/product_details_screen.dart';
import 'package:tfos/utils/constants.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/products-screen';

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: _ui(productViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProductScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(ProductViewModel productViewModel) {
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
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.rectangle),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    '$baseImageURL${productViewModel.products[index].image}'),
              ),
            ),
            title: Text(
              productViewModel.products[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(productViewModel.products[index].description),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              productViewModel
                  .setSelectedProduct(productViewModel.products[index]);
              Navigator.pushNamed(ctx, ProductDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
