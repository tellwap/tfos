import 'package:flutter/material.dart';
import 'package:tfos/manufactures/views/add_manufacture_screen.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:tfos/manufactures/view_models/manufacture_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/manufactures/views/manufacture_details_screen.dart';

class ManufacturesScreen extends StatelessWidget {
  const ManufacturesScreen({Key? key}) : super(key: key);
  static const routeName = '/manufactures-screen';

  @override
  Widget build(BuildContext context) {
    ManufactureViewModel manufactureViewModel =
        context.watch<ManufactureViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manufactures'),
      ),
      body: _ui(manufactureViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddManufactureScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(ManufactureViewModel manufactureViewModel) {
    if (manufactureViewModel.loading) {
      return const AppLoading();
    }

    if (manufactureViewModel.manufactureError != null) {
      return AppError(
        errorMessage: '${manufactureViewModel.manufactureError?.message}',
      );
    }

    return ListView.builder(
      itemCount: manufactureViewModel.manufactures.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading:
                Text(manufactureViewModel.manufactures[index].id.toString()),
            title: Text(
              manufactureViewModel.manufactures[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(manufactureViewModel.manufactures[index].email),
                Text(manufactureViewModel.manufactures[index].phoneNumber),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              manufactureViewModel.setSelectedManufacture(
                  manufactureViewModel.manufactures[index]);
              Navigator.pushNamed(ctx, ManufactureDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
