import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorMessage;
  const AppError({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Text(errorMessage),
      ),
    );
  }
}
