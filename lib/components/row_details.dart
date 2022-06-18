import 'package:flutter/material.dart';

class RowDetails extends StatelessWidget {
  const RowDetails({Key? key, required this.title, required this.description})
      : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
