import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/areas/view_models/area_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/areas/views/edit_area_screen.dart';
import 'package:tfos/components/row_details.dart';

class AreaDetailsScreen extends StatelessWidget {
  const AreaDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/area-details-screen';

  @override
  Widget build(BuildContext context) {
    AreaViewModel areaViewModel = context.watch<AreaViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${areaViewModel.selectedArea?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RowDetails(
                title: 'NAME OF AREA',
                description: '${areaViewModel.selectedArea?.name}'),
            RowDetails(
                title: 'CODE',
                description: '${areaViewModel.selectedArea?.code}'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, EditAreaScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                areaViewModel.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<AreaViewModel>(context,
                                  listen: false)
                              .deleteArea(
                                  areaViewModel.selectedArea?.id as int);
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
