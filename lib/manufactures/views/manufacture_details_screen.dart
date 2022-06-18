import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/components/row_details.dart';
import 'package:tfos/manufactures/view_models/manufacture_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/manufactures/views/edit_manufacture_screen.dart';

class ManufactureDetailsScreen extends StatelessWidget {
  const ManufactureDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/manufacture-details-screen';

  @override
  Widget build(BuildContext context) {
    ManufactureViewModel manufactureViewModel =
        context.watch<ManufactureViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${manufactureViewModel.selectedManufacture?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RowDetails(
                title: 'REGISTRATION ID',
                description: '${manufactureViewModel.selectedManufacture?.id}'),
            RowDetails(
                title: 'MANUFACTURE NAME',
                description:
                    '${manufactureViewModel.selectedManufacture?.name}'),
            RowDetails(
                title: 'EMAIL',
                description:
                    '${manufactureViewModel.selectedManufacture?.email}'),
            RowDetails(
                title: 'PHONE NUMBER',
                description:
                    '${manufactureViewModel.selectedManufacture?.phoneNumber}'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, EditManufactureScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                manufactureViewModel.loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<ManufactureViewModel>(context,
                                  listen: false)
                              .deleteManufacture(manufactureViewModel
                                  .selectedManufacture?.id as int);
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
