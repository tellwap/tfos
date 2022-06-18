import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/categories/view_models/category_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/categories/views/edit_category_screen.dart';
import 'package:tfos/components/row_details.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/category-details-screen';

  @override
  Widget build(BuildContext context) {
    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${categoryViewModel.selectedCategory?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RowDetails(
                title: 'CATEGORY NAME',
                description: '${categoryViewModel.selectedCategory?.name}'),
            RowDetails(
                title: 'DETAILS',
                description: '${categoryViewModel.selectedCategory?.details}'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, EditCategoryScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                categoryViewModel.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<CategoryViewModel>(context,
                                  listen: false)
                              .deleteCategory(categoryViewModel
                                  .selectedCategory?.id as int);
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
