import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/units/view_models/unit_view_model.dart';

class AddUnitScreen extends StatelessWidget {
  const AddUnitScreen({Key? key}) : super(key: key);
  static const routeName = '/add-unit-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _textEditingNameController = TextEditingController();
    final _textEditingDetailsController = TextEditingController();

    UnitViewModel unitViewModel = context.watch<UnitViewModel>();
    void _createNewUnit() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<UnitViewModel>(context, listen: false).createUnits(
          _textEditingNameController.text, _textEditingDetailsController.text);
      if (unitViewModel.unitError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${unitViewModel.unitError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unit created successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Unit'),
      ),
      body: Card(
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
                  decoration: const InputDecoration(label: Text('Unit Name')),
                  validator: (val) =>
                      val!.isEmpty ? 'Unit name is required' : null,
                ),
                TextFormField(
                  controller: _textEditingDetailsController,
                  maxLines: 3,
                  decoration: const InputDecoration(label: Text('Details')),
                  validator: (val) =>
                      val!.isEmpty ? 'Details is required' : null,
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: unitViewModel.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _createNewUnit,
                            child: const Text('Add Unit')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
