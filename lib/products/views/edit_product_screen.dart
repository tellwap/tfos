import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/products/models/product.dart';
import 'package:tfos/products/view_models/product_view_model.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-product-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    final _textEditingNameController = TextEditingController(
        text: '${productViewModel.selectedProduct?.name}');
    final _textEditingDetailsController = TextEditingController(
        text: '${productViewModel.selectedProduct?.description}');

    void _createNewProduct() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<ProductViewModel>(context, listen: false).updateProduct(
        productViewModel.selectedProduct?.id as int,
        Product(
            id: 1,
            name: 'name',
            categoryId: 1,
            unitId: 1,
            price: 200,
            quantity: 10,
            stock: 1,
            description: 'description'),
      );
      if (productViewModel.productError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${productViewModel.productError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product updated successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Card(
        margin: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _textEditingNameController,
                  decoration:
                      const InputDecoration(label: Text('Product Name')),
                  validator: (val) =>
                      val!.isEmpty ? 'Product name is required' : null,
                ),
                TextFormField(
                  controller: _textEditingDetailsController,
                  maxLines: 3,
                  decoration: const InputDecoration(label: Text('Details')),
                  validator: (val) =>
                      val!.isEmpty ? 'Details is required' : null,
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: productViewModel.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _createNewProduct,
                            child: const Text('Update Product')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
