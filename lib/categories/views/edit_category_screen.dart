import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/categories/view_models/category_view_model.dart';
import 'package:tfos/units/view_models/unit_view_model.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-category-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();
    final _textEditingNameController = TextEditingController(
        text: '${categoryViewModel.selectedCategory?.name}');
    final _textEditingDetailsController = TextEditingController(
        text: '${categoryViewModel.selectedCategory?.details}');

    void _createNewCategory() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<UnitViewModel>(context, listen: false).updateUnit(
          categoryViewModel.selectedCategory?.id as int,
          _textEditingNameController.text,
          _textEditingDetailsController.text);
      if (categoryViewModel.categoryError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${categoryViewModel.categoryError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Category updated successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
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
                            child: const Text('Update Unit')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
