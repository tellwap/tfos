import 'package:flutter/material.dart';
import 'package:tfos/units/views/add_unit_screen.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:tfos/units/view_models/unit_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/units/views/unit_details_screen.dart';

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({Key? key}) : super(key: key);
  static const routeName = '/units-screen';

  @override
  Widget build(BuildContext context) {
    UnitViewModel unitViewModel = context.watch<UnitViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Units'),
      ),
      body: _ui(unitViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddUnitScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(UnitViewModel unitViewModel) {
    if (unitViewModel.loading) {
      return const AppLoading();
    }

    if (unitViewModel.unitError != null) {
      return AppError(
        errorMessage: '${unitViewModel.unitError?.message}',
      );
    }

    return ListView.builder(
      itemCount: unitViewModel.units.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: Text(unitViewModel.units[index].id.toString()),
            title: Text(
              unitViewModel.units[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(unitViewModel.units[index].details),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              unitViewModel.setSelectedUnit(unitViewModel.units[index]);
              Navigator.pushNamed(ctx, UnitDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
