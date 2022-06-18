import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/areas/view_models/area_view_model.dart';

class EditAreaScreen extends StatelessWidget {
  const EditAreaScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-area-screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    AreaViewModel areaViewModel = context.watch<AreaViewModel>();
    final _textEditingNameController =
        TextEditingController(text: '${areaViewModel.selectedArea?.name}');
    final _textEditingDetailsController =
        TextEditingController(text: '${areaViewModel.selectedArea?.code}');

    void _createNewArea() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      await Provider.of<AreaViewModel>(context, listen: false).updateArea(
          areaViewModel.selectedArea?.id as int,
          _textEditingNameController.text,
          _textEditingDetailsController.text);
      if (areaViewModel.areaError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${areaViewModel.areaError?.message}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Area updated successfully')));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Area'),
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
                  controller: _textEditingDetailsController,
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
                            child: const Text('Update Area')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
