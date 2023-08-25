import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget(
    this.errorString, {
    Key? key,
  }) : super(key: key);

  final String errorString;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorString,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
      ),
    );
  }
}
