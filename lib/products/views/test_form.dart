import 'package:flutter/material.dart';

class TestForm extends StatefulWidget {
  const TestForm({Key? key}) : super(key: key);

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  @override
  Widget build(BuildContext context) {
    var _selectedStock;
    var _stocks = ['Enable', ' Disable'];

    return Form(
      child: ListView(
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(label: Text('Stock Management')),
            value: _selectedStock,
            hint: const Text('Select Stock'),
            items: _stocks
                .map(
                  (stock) => DropdownMenuItem<String>(
                    value: stock,
                    child: Text(stock),
                  ),
                )
                .toList(),
            onChanged: (selectedStock) {
              setState(() {
                _selectedStock = selectedStock;
              });
            },
          ),
        ],
      ),
    );
  }
}
