import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/categories/view_models/category_view_model.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/add-category-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _textEditingNameController = TextEditingController();
    final _textEditingDetailsController = TextEditingController();

    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();

    void _createNewCategory() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      await Provider.of<CategoryViewModel>(context, listen: false)
          .createCategory(_textEditingNameController.text,
              _textEditingDetailsController.text);
      if (categoryViewModel.categoryError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${categoryViewModel.categoryError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Category created successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
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
                      const InputDecoration(label: Text('Category Name')),
                  validator: (val) =>
                      val!.isEmpty ? 'Category name is required' : null,
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
                    child: categoryViewModel.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _createNewCategory,
                            child: const Text('Add Category')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
