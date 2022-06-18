import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tfos/components/row_details.dart';
import 'package:tfos/retailers/view_models/retailer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tfos/retailers/views/edit_retailer_screen.dart';

class RetailerDetailsScreen extends StatelessWidget {
  const RetailerDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/retailer-details-screen';

  @override
  Widget build(BuildContext context) {
    RetailerViewModel retailerViewModel = context.watch<RetailerViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${retailerViewModel.selectedRetailer?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RowDetails(
                title: 'REGISTRATION ID',
                description: '${retailerViewModel.selectedRetailer?.id}'),
            RowDetails(
                title: 'RETAILER NAME',
                description: '${retailerViewModel.selectedRetailer?.name}'),
            RowDetails(
                title: 'EMAIL',
                description: '${retailerViewModel.selectedRetailer?.email}'),
            RowDetails(
                title: 'PHONE NUMBER',
                description:
                    '${retailerViewModel.selectedRetailer?.phoneNumber}'),
            RowDetails(
                title: 'ADDRESS',
                description: '${retailerViewModel.selectedRetailer?.address}'),
            const Divider(),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, EditRetailerScreen.routeName);
                    },
                    child: const Text('Edit')),
                const SizedBox(
                  width: 10,
                ),
                retailerViewModel.loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<RetailerViewModel>(context,
                                  listen: false)
                              .deleteRetailer(retailerViewModel
                                  .selectedRetailer?.id as int);
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
