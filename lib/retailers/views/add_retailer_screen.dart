import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/retailers/view_models/retailer_view_model.dart';

class AddRetailerScreen extends StatelessWidget {
  const AddRetailerScreen({Key? key}) : super(key: key);
  static const routeName = '/add-retailer-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _textEditingNameController = TextEditingController();
    final _textEditingEmailController = TextEditingController();
    final _textEditingPhoneController = TextEditingController();
    final _textEditingAddressController = TextEditingController();

    RetailerViewModel retailerViewModel = context.watch<RetailerViewModel>();
    void _createNewRetailer() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<RetailerViewModel>(context, listen: false)
          .createRetailers(
              _textEditingNameController.text,
              _textEditingEmailController.text,
              _textEditingPhoneController.text,
              _textEditingAddressController.text);
      if (retailerViewModel.retailerError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${retailerViewModel.retailerError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Retailer created successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Retailer'),
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
                        const InputDecoration(label: Text('Retailer Name')),
                    validator: (val) =>
                        val!.isEmpty ? 'Retailer name is required' : null,
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
                      child: retailerViewModel.loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _createNewRetailer,
                              child: const Text('Add Retailer')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
