import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/components/row_details.dart';
import 'package:tfos/products/view_models/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/products/views/edit_product_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${productViewModel.selectedProduct?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RowDetails(
                title: 'PRODUCT NAME',
                description: '${productViewModel.selectedProduct?.name}'),
            RowDetails(
                title: 'CATEGORY',
                description:
                    '${productViewModel.selectedProduct?.category?.name}'),
            RowDetails(
                title: 'UNIT',
                description: '${productViewModel.selectedProduct?.unit?.name}'),
            RowDetails(
                title: 'PRICE',
                description: '${productViewModel.selectedProduct?.price}'),
            RowDetails(
                title: 'DETAILS',
                description:
                    '${productViewModel.selectedProduct?.description}'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, EditProductScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                productViewModel.loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<ProductViewModel>(context,
                                  listen: false)
                              .deleteProduct(
                                  productViewModel.selectedProduct?.id as int);
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
