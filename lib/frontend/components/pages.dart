import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String title;
  final Widget? body;

  const BasePage({Key? key, required this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toUpperCase()),
      ),
      body: body ??
          const Center(
            child: Text('... quite empty over here :0'),
          ),
    );
  }
}
