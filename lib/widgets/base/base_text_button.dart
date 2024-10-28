import 'package:flutter/material.dart';

class BaseTextButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const BaseTextButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontSize: 20)));
  }
}
