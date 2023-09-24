import 'package:flutter/material.dart';

class DropdownItem<T> {
  final T value;
  final String label;

  DropdownItem({required this.value, required this.label});
}

class DropdownButtonList<T> extends StatelessWidget {
  final List<DropdownItem<T>> items;
  final double fontSize;
  final Color fontColor;
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const DropdownButtonList({
    Key? key,
    required this.items,
    this.fontSize = 16,
    this.fontColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: backgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              items[index].label,
              style: TextStyle(
                fontSize: fontSize,
                color: fontColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
