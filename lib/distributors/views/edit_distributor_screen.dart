import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/distributors/view_models/distributor_view_model.dart';

class EditDistributorScreen extends StatelessWidget {
  const EditDistributorScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-distributor-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    DistributorViewModel distributorViewModel =
        context.watch<DistributorViewModel>();
    final _textEditingNameController = TextEditingController(
        text: '${distributorViewModel.selectedDistributor?.name}');
    final _textEditingDetailsController = TextEditingController(
        text: '${distributorViewModel.selectedDistributor?.email}');
    final _textEditingPhoneController = TextEditingController(
        text: '${distributorViewModel.selectedDistributor?.phoneNumber}');
    final _textEditingAddressController = TextEditingController(
        text: '${distributorViewModel.selectedDistributor?.address}');

    void _createNewDistributor() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<DistributorViewModel>(context, listen: false)
          .updateDistributor(
              distributorViewModel.selectedDistributor?.id as int,
              _textEditingNameController.text,
              _textEditingDetailsController.text,
              _textEditingPhoneController.text,
              _textEditingAddressController.text);

      if (distributorViewModel.distributorError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('${distributorViewModel.distributorError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Distributor updated successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Distributor'),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _textEditingNameController,
                    decoration:
                        const InputDecoration(label: Text('Distributor Name')),
                    validator: (val) =>
                        val!.isEmpty ? 'Distributor name is required' : null,
                  ),
                  TextFormField(
                    controller: _textEditingDetailsController,
                    decoration: const InputDecoration(label: Text('Email')),
                    validator: (val) =>
                        val!.isEmpty ? 'Email is required' : null,
                  ),
                  TextFormField(
                    controller: _textEditingPhoneController,
                    decoration:
                        const InputDecoration(label: Text('Phonenumber')),
                    validator: (val) =>
                        val!.isEmpty ? 'Phonenumber is required' : null,
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    controller: _textEditingAddressController,
                    maxLines: 3,
                    decoration: const InputDecoration(label: Text('Address')),
                    validator: (val) =>
                        val!.isEmpty ? 'Address is required' : null,
                    keyboardType: TextInputType.phone,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: distributorViewModel.loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _createNewDistributor,
                              child: const Text('Update Distributor')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
