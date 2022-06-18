import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/retailers/view_models/retailer_view_model.dart';

class EditRetailerScreen extends StatelessWidget {
  const EditRetailerScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-retailer-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    RetailerViewModel retailerViewModel = context.watch<RetailerViewModel>();
    final _textEditingNameController = TextEditingController(
        text: '${retailerViewModel.selectedRetailer?.name}');
    final _textEditingDetailsController = TextEditingController(
        text: '${retailerViewModel.selectedRetailer?.email}');

    void _createNewRetailer() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<RetailerViewModel>(context, listen: false)
          .updateRetailer(
              retailerViewModel.selectedRetailer?.id as int,
              _textEditingNameController.text,
              _textEditingDetailsController.text);
      if (retailerViewModel.retailerError != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${retailerViewModel.retailerError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Retailer updated successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Retailer'),
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
                    controller: _textEditingDetailsController,
                    maxLines: 3,
                    decoration: const InputDecoration(label: Text('Email')),
                    validator: (val) =>
                        val!.isEmpty ? 'Email is required' : null,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: retailerViewModel.loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _createNewRetailer,
                              child: const Text('Update Retailer')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
