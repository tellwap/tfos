import 'package:flutter/material.dart';
import 'package:tfos/distributors/views/add_distributor_screen.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:tfos/distributors/view_models/distributor_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/distributors/views/distributor_details_screen.dart';

class DistributorsScreen extends StatelessWidget {
  const DistributorsScreen({Key? key}) : super(key: key);
  static const routeName = '/distributors-screen';

  @override
  Widget build(BuildContext context) {
    DistributorViewModel distributorViewModel =
        context.watch<DistributorViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Distributors'),
      ),
      body: _ui(distributorViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddDistributorScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(DistributorViewModel distributorViewModel) {
    if (distributorViewModel.loading) {
      return const AppLoading();
    }

    if (distributorViewModel.distributorError != null) {
      return AppError(
        errorMessage: '${distributorViewModel.distributorError?.message}',
      );
    }

    return ListView.builder(
      itemCount: distributorViewModel.distributors.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading:
                Text(distributorViewModel.distributors[index].id.toString()),
            title: Text(
              distributorViewModel.distributors[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(distributorViewModel.distributors[index].email),
                Text(distributorViewModel.distributors[index].phoneNumber),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              distributorViewModel.setSelectedDistributor(
                  distributorViewModel.distributors[index]);
              Navigator.pushNamed(ctx, DistributorDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
