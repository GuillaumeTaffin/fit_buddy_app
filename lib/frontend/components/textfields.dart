import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const OutlinedTextField({Key? key, required this.labelText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
