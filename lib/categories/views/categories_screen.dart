import 'package:flutter/material.dart';
import 'package:tfos/categories/view_models/category_view_model.dart';
import 'package:tfos/categories/views/add_category_screen.dart';
import 'package:tfos/categories/views/category_details_screen.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/categories-screen';

  @override
  Widget build(BuildContext context) {
    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: _ui(categoryViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddCategoryScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(CategoryViewModel categoryViewModel) {
    print(categoryViewModel.categories);
    if (categoryViewModel.loading) {
      return const AppLoading();
    }

    if (categoryViewModel.categoryError != null) {
      return AppError(
        errorMessage: '${categoryViewModel.categoryError?.message}',
      );
    }

    return ListView.builder(
      itemCount: categoryViewModel.categories.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: Text(categoryViewModel.categories[index].id.toString()),
            title: Text(
              categoryViewModel.categories[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(categoryViewModel.categories[index].details),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              categoryViewModel
                  .setSelectedCategory(categoryViewModel.categories[index]);
              Navigator.pushNamed(ctx, CategoryDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
