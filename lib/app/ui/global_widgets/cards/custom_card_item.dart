import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  final Widget child;

  CustomCardItem({required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          child: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: child,
          ),
        );
      },
    );
  }
}
