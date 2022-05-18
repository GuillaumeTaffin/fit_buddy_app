import 'package:flutter/material.dart';

class Title1 extends StatelessWidget {
  final String text;

  const Title1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}
