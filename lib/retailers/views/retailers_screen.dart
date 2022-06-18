import 'package:flutter/material.dart';
import 'package:tfos/retailers/views/add_retailer_screen.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:tfos/retailers/view_models/retailer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/retailers/views/retailer_details_screen.dart';

class RetailersScreen extends StatelessWidget {
  const RetailersScreen({Key? key}) : super(key: key);
  static const routeName = '/retailers-screen';

  @override
  Widget build(BuildContext context) {
    RetailerViewModel retailerViewModel = context.watch<RetailerViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retailers'),
      ),
      body: _ui(retailerViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddRetailerScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(RetailerViewModel retailerViewModel) {
    if (retailerViewModel.loading) {
      return const AppLoading();
    }

    if (retailerViewModel.retailerError != null) {
      return AppError(
        errorMessage: '${retailerViewModel.retailerError?.message}',
      );
    }

    return ListView.builder(
      itemCount: retailerViewModel.retailers.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: Text(retailerViewModel.retailers[index].id.toString()),
            title: Text(
              retailerViewModel.retailers[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(retailerViewModel.retailers[index].email),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              retailerViewModel
                  .setSelectedRetailer(retailerViewModel.retailers[index]);
              Navigator.pushNamed(ctx, RetailerDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
