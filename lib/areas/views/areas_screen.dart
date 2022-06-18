import 'package:flutter/material.dart';
import 'package:tfos/areas/view_models/area_view_model.dart';
import 'package:tfos/areas/views/add_area_screen.dart';
import 'package:tfos/areas/views/area_details_screen.dart';
import 'package:tfos/components/app_error.dart';
import 'package:tfos/components/app_loading.dart';
import 'package:provider/provider.dart';

class AreasScreen extends StatelessWidget {
  const AreasScreen({Key? key}) : super(key: key);
  static const routeName = '/area-screen';

  @override
  Widget build(BuildContext context) {
    AreaViewModel areaViewModel = context.watch<AreaViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Areas'),
      ),
      body: _ui(areaViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddAreaScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(AreaViewModel areaViewModel) {
    if (areaViewModel.loading) {
      return const AppLoading();
    }

    if (areaViewModel.areaError != null) {
      return AppError(
        errorMessage: '${areaViewModel.areaError?.message}',
      );
    }

    return ListView.builder(
      itemCount: areaViewModel.items.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: Text(areaViewModel.items[index].id.toString()),
            title: Text(
              areaViewModel.items[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(areaViewModel.items[index].code),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              areaViewModel.setSelectedArea(areaViewModel.items[index]);
              Navigator.pushNamed(ctx, AreaDetailsScreen.routeName);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
