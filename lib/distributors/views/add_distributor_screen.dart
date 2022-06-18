import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/distributors/view_models/distributor_view_model.dart';

class AddDistributorScreen extends StatelessWidget {
  const AddDistributorScreen({Key? key}) : super(key: key);
  static const routeName = '/add-distributor-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _textEditingNameController = TextEditingController();
    final _textEditingEmailController = TextEditingController();
    final _textEditingPhoneController = TextEditingController();
    final _textEditingAddressController = TextEditingController();

    DistributorViewModel distributorViewModel =
        context.watch<DistributorViewModel>();
    void _createNewDistributor() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<DistributorViewModel>(context, listen: false)
          .createDistributors(
              _textEditingNameController.text,
              _textEditingEmailController.text,
              _textEditingPhoneController.text,
              _textEditingAddressController.text);
      if (distributorViewModel.distributorError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('${distributorViewModel.distributorError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Distributor created successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Distributor'),
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
                    controller: _textEditingEmailController,
                    decoration: const InputDecoration(label: Text('Email')),
                    validator: (val) => EmailValidator.validate(val.toString())
                        ? null
                        : "Please enter a valid email",
                    keyboardType: TextInputType.emailAddress,
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
                              child: const Text('Add Distributor')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
