import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/distributors/models/distributor.dart';
import 'package:tfos/distributors/view_models/distributor_view_model.dart';
import 'package:tfos/providers/orders.dart';

class AssignOrderDistributorScreen extends StatefulWidget {
  const AssignOrderDistributorScreen({Key? key}) : super(key: key);
  static const routeName = '/assign-order-distributor-screen';
  @override
  State<AssignOrderDistributorScreen> createState() =>
      _AssignOrderDistributorScreenState();
}

class _AssignOrderDistributorScreenState
    extends State<AssignOrderDistributorScreen> {
  var _selectDistributor;

  @override
  Widget build(BuildContext context) {
    final _distributors =
        Provider.of<DistributorViewModel>(context).distributors;

    final orders = Provider.of<Orders>(context, listen: false);
    final orderId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: const Text('Assign Distributor')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          DropdownButtonFormField<Distributor>(
            decoration:
                const InputDecoration(label: Text('Select Distributor')),
            value: _selectDistributor,
            items: _distributors
                .map(
                  (distributor) => DropdownMenuItem<Distributor>(
                    value: distributor,
                    child: Text(distributor.name),
                  ),
                )
                .toList(),
            onChanged: (selectDistributor) {
              setState(() {
                _selectDistributor = selectDistributor;
              });
            },
            validator: (val) => val == null ? 'Unit is  is required' : null,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async {
                if (_selectDistributor == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please select distributor')));
                  return;
                }
                await orders.assignOrder(orderId, _selectDistributor.id);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Distributor assigned successfully')));
              },
              child: const Text('Assign Distributor'))
        ]),
      ),
    );
  }
}
