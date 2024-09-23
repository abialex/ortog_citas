// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ortog_citas/app/ui/modules/cita/cita_list/widget/responsive_app.dart';

class DialogGeneric extends StatelessWidget {
  const DialogGeneric({
    required this.widget,
    this.largeWidthPercent = 0.9,
    this.mediumWidthPercent = 0.5,
    this.maxHeightPercent = 0.8,
    this.backgroundColor,
    super.key,
  });
  final double largeWidthPercent;
  final double mediumWidthPercent;
  final double maxHeightPercent;
  final Widget widget;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveApp.isLargeWeb(context) || ResponsiveApp.isMediumWeb(context);
    double dialogWidth;
    if (isDesktop) {
      dialogWidth = MediaQuery.of(context).size.width * mediumWidthPercent;
    } else {
      dialogWidth = MediaQuery.of(context).size.width * largeWidthPercent;
    }
    final maxHeight = MediaQuery.of(context).size.height * maxHeightPercent;

    return Dialog(
      backgroundColor: backgroundColor ?? Colors.grey,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: dialogWidth,
        constraints: BoxConstraints(
          maxHeight: maxHeight,
        ),
        child: widget,
      ),
    );
  }
}
