import 'package:flutter/material.dart';

class CustomDropdownItem<T> {
  final T value;
  final Widget child;

  CustomDropdownItem({
    required this.value,
    required this.child,
  });
}
