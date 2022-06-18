import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/areas/view_models/area_view_model.dart';

class AddAreaScreen extends StatelessWidget {
  const AddAreaScreen({Key? key}) : super(key: key);
  static const routeName = '/add-area-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _textEditingNameController = TextEditingController();
    final _textEditingCodeController = TextEditingController();

    AreaViewModel areaViewModel = context.watch<AreaViewModel>();
    void _createNewArea() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<AreaViewModel>(context, listen: false).createArea(
          _textEditingNameController.text, _textEditingCodeController.text);
      if (areaViewModel.areaError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${areaViewModel.areaError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Area created successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Area'),
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
                  decoration: const InputDecoration(label: Text('Area Name')),
                  validator: (val) =>
                      val!.isEmpty ? 'Area name is required' : null,
                ),
                TextFormField(
                  controller: _textEditingCodeController,
                  maxLines: 3,
                  decoration: const InputDecoration(label: Text('Code')),
                  validator: (val) => val!.isEmpty ? 'Code is required' : null,
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: areaViewModel.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _createNewArea,
                            child: const Text('Add Area')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
