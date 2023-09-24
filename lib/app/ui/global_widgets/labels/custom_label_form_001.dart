import 'package:flutter/material.dart';

import '../../../core/utils/style_utils.dart';

class CustomLabelForm001 extends StatelessWidget {
  final String label;
  final double left;
  final double top;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double textSize;
  const CustomLabelForm001({
    super.key,
    required this.label,
    required this.left,
    required this.top,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
    this.textSize = StyleUtils.P0_15,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, 0, 0),
      child: Text(
        label,
        textAlign: textAlign,
        style: TextStyle(fontWeight: fontWeight, fontSize: textSize),
      ),
    );
  }
}
