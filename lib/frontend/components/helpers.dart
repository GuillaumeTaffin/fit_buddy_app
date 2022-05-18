import 'package:flutter/material.dart';

extension PadList on List<Widget> {
  List<Widget> padItems(EdgeInsetsGeometry padding) => map(
        (e) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: e,
        ),
      ).toList();
}
