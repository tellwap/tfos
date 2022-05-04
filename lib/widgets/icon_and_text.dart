import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final String title;
  final IconData icon;
  const IconAndText({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 10,
        ),
        Text(title)
      ],
    );
  }
}
