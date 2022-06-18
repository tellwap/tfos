import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/manufactures/view_models/manufacture_view_model.dart';

class AddManufactureScreen extends StatelessWidget {
  const AddManufactureScreen({Key? key}) : super(key: key);
  static const routeName = '/add-manufacture-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _textEditingNameController = TextEditingController();
    final _textEditingEmailController = TextEditingController();
    final _textEditingPhoneController = TextEditingController();
    final _textEditingAddressController = TextEditingController();
    final _textEditingPasswordController = TextEditingController();

    ManufactureViewModel manufactureViewModel =
        context.watch<ManufactureViewModel>();
    void _createNewManufacture() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<ManufactureViewModel>(context, listen: false)
          .createManufactures(
        _textEditingNameController.text,
        _textEditingEmailController.text,
        _textEditingPhoneController.text,
        _textEditingAddressController.text,
        _textEditingPasswordController.text,
      );
      if (manufactureViewModel.manufactureError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('${manufactureViewModel.manufactureError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Manufacture created successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Manufacture'),
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
                        const InputDecoration(label: Text('Manufacture Name')),
                    validator: (val) => EmailValidator.validate(val.toString())
                        ? null
                        : "Please enter a valid email",
                  ),
                  TextFormField(
                    controller: _textEditingEmailController,
                    decoration: const InputDecoration(label: Text('Email')),
                    validator: (val) =>
                        val!.isEmpty ? 'Email is required' : null,
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
                  TextFormField(
                    controller: _textEditingPasswordController,
                    decoration: const InputDecoration(label: Text('Password')),
                    validator: (val) =>
                        val!.isEmpty ? 'Password is required' : null,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: manufactureViewModel.loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _createNewManufacture,
                              child: const Text('Add Manufacture')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
