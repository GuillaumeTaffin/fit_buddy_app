import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;

  const OutlinedTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
