import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/components/row_details.dart';
import 'package:tfos/units/view_models/unit_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/units/views/edit_unit_screen.dart';

class UnitDetailsScreen extends StatelessWidget {
  const UnitDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/unit-details-screen';

  @override
  Widget build(BuildContext context) {
    UnitViewModel unitViewModel = context.watch<UnitViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${unitViewModel.selectedUnit?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RowDetails(
                title: 'UNIT NAME',
                description: '${unitViewModel.selectedUnit?.name}'),
            RowDetails(
                title: 'DETAILS',
                description: '${unitViewModel.selectedUnit?.details}'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, EditUnitScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                unitViewModel.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<UnitViewModel>(context,
                                  listen: false)
                              .deleteUnit(
                                  unitViewModel.selectedUnit?.id as int);
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
