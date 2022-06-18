import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/manufactures/view_models/manufacture_view_model.dart';

class EditManufactureScreen extends StatelessWidget {
  const EditManufactureScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-manufacture-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    ManufactureViewModel manufactureViewModel =
        context.watch<ManufactureViewModel>();
    final _textEditingNameController = TextEditingController(
        text: '${manufactureViewModel.selectedManufacture?.name}');
    final _textEditingDetailsController = TextEditingController(
        text: '${manufactureViewModel.selectedManufacture?.email}');

    void _createNewManufacture() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<ManufactureViewModel>(context, listen: false)
          .updateManufacture(
              manufactureViewModel.selectedManufacture?.id as int,
              _textEditingNameController.text,
              _textEditingDetailsController.text);
      if (manufactureViewModel.manufactureError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('${manufactureViewModel.manufactureError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Manufacture updated successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Manufacture'),
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
                    validator: (val) =>
                        val!.isEmpty ? 'Manufacture name is required' : null,
                  ),
                  TextFormField(
                    controller: _textEditingDetailsController,
                    maxLines: 3,
                    decoration: const InputDecoration(label: Text('Email')),
                    validator: (val) =>
                        val!.isEmpty ? 'Email is required' : null,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: manufactureViewModel.loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _createNewManufacture,
                              child: const Text('Update Manufacture')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
