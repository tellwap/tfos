import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/components/row_details.dart';
import 'package:tfos/distributors/view_models/distributor_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/distributors/views/edit_distributor_screen.dart';

class DistributorDetailsScreen extends StatelessWidget {
  const DistributorDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/distributor-details-screen';

  @override
  Widget build(BuildContext context) {
    DistributorViewModel distributorViewModel =
        context.watch<DistributorViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('${distributorViewModel.selectedDistributor?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RowDetails(
                title: 'Registration ID',
                description: '${distributorViewModel.selectedDistributor?.id}'),
            RowDetails(
                title: 'Distributor Name',
                description:
                    '${distributorViewModel.selectedDistributor?.name}'),
            RowDetails(
                title: 'Email',
                description:
                    '${distributorViewModel.selectedDistributor?.email}'),
            RowDetails(
                title: 'Phone number',
                description:
                    '${distributorViewModel.selectedDistributor?.phoneNumber}'),
            RowDetails(
                title: 'Address',
                description:
                    '${distributorViewModel.selectedDistributor?.address}'),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, EditDistributorScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                distributorViewModel.loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<DistributorViewModel>(context,
                                  listen: false)
                              .deleteDistributor(distributorViewModel
                                  .selectedDistributor?.id as int);
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
