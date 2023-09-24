import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color color;
  const CustomProgressIndicator({super.key, this.color = SlgColors.SLGcolor});
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
