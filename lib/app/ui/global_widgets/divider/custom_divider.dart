import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final String title;
  final Color color;
  final double paddindTop;
  final double paddindRigth;
  final double paddingBootom;
  final bool visibility;

  const CustomDivider({
    super.key,
    required this.title,
    this.color = OrtogColors.ortog_color,
    this.paddindTop = 10,
    this.paddindRigth = 10,
    this.paddingBootom = 10,
    this.visibility = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(paddindRigth, paddindTop, 0, 0),
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: visibility,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500, color: color),
              ),
            )),
        Divider(
          color: color,
          thickness: 1,
        ),
      ],
    );
  }
}
