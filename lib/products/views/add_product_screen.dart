import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tfos/categories/models/category.dart';
import 'package:tfos/categories/view_models/category_view_model.dart';
import 'package:tfos/products/models/product.dart';
import 'package:tfos/products/models/stock.dart';
import 'package:tfos/products/view_models/product_view_model.dart';
import 'package:tfos/units/models/unit.dart';
import 'package:tfos/units/view_models/unit_view_model.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const routeName = '/add-product-screen';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _textEditingNameController = TextEditingController();
  final _textEditingDetailsController = TextEditingController();
  final _textEditingPriceController = TextEditingController();
  final _textEditingQuantityController = TextEditingController();

  Unit? _selectedUnit;
  Category? _selectedCategory;
  Stock? _selectedStock;

  void _createNewProduct(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await Provider.of<ProductViewModel>(context, listen: false).createProducts(
      Product(
          id: 1,
          name: _textEditingNameController.text,
          categoryId: _selectedCategory?.id,
          unitId: _selectedUnit?.id,
          price: double.parse(_textEditingPriceController.text),
          quantity: int.parse(_textEditingQuantityController.text),
          stock: _selectedStock?.id,
          description: _textEditingDetailsController.text),
    );
    ProductViewModel productViewModel =
        Provider.of<ProductViewModel>(context, listen: false);

    if (productViewModel.productError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${productViewModel.productError?.message}')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product created successfully')));
      Navigator.pop(context);
    }
  }

  final _stocks = [Stock(id: 1, name: 'Enable'), Stock(id: 2, name: 'Disable')];

  @override
  Widget build(BuildContext context) {
    final _units = Provider.of<UnitViewModel>(context).units;
    final _categories = Provider.of<CategoryViewModel>(context).categories;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Card(
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
                    controller: _textEditingPriceController,
                    decoration: const InputDecoration(label: Text('Price')),
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val!.isEmpty ? 'Price is required' : null,
                  ),
                  DropdownButtonFormField<Unit>(
                    decoration: const InputDecoration(label: Text('Unit')),
                    value: _selectedUnit,
                    items: _units
                        .map(
                          (unit) => DropdownMenuItem<Unit>(
                            value: unit,
                            child: Text(unit.name),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedUnit) {
                      setState(() {
                        _selectedUnit = selectedUnit;
                        //  _selectedUnitId = selectedUnit.id;
                      });
                    },
                    validator: (val) =>
                        val == null ? 'Unit is  is required' : null,
                  ),
                  DropdownButtonFormField<Category>(
                    decoration: const InputDecoration(label: Text('Category')),
                    value: _selectedCategory,
                    items: _categories
                        .map(
                          (category) => DropdownMenuItem<Category>(
                            value: category,
                            child: Text(category.name),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedCategory) {
                      setState(() {
                        //_selectedCategory = _categories.indexOf(value!);
                        _selectedCategory = selectedCategory;
                      });
                    },
                    validator: (val) =>
                        val == null ? 'Category is  is required' : null,
                  ),
                  TextFormField(
                    controller: _textEditingQuantityController,
                    decoration: const InputDecoration(label: Text('Quantity')),
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val!.isEmpty ? 'quantity is required' : null,
                  ),
                  DropdownButtonFormField<Stock>(
                    decoration:
                        const InputDecoration(label: Text('Stock Management')),
                    value: _selectedStock,
                    // hint: const Text('Select Stock'),
                    items: _stocks
                        .map(
                          (stock) => DropdownMenuItem<Stock>(
                            value: stock,
                            child: Text(stock.name),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedStock) {
                      setState(() {
                        _selectedStock = selectedStock;
                      });
                    },
                    validator: (val) =>
                        val == null ? 'Stock is  is required' : null,
                  ),
                  TextFormField(
                    controller: _textEditingDetailsController,
                    maxLines: 3,
                    decoration:
                        const InputDecoration(label: Text('Description')),
                    validator: (val) =>
                        val!.isEmpty ? 'Description is required' : null,
                  ),
                  Consumer<ProductViewModel>(
                    builder: (ctx, product, ch) => Container(
                        alignment: Alignment.bottomRight,
                        child: product.loading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () => _createNewProduct(context),
                                child: const Text('Add Product'))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
