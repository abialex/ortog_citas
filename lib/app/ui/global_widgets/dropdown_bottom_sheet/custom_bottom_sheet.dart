import 'package:flutter/material.dart';

import '../../../core/utils/style_utils.dart';
import '../../theme/app_colors.dart';

class CustomBottomSheet<T, O> extends StatelessWidget {
  final double heightBottomSheet;
  final O itemObject;
  // final T controller;
  // final Function(O) onPressedDynamic;
  final List<Widget> listOptions1;
  final List<Widget>? listOptions2;
  final List<Widget>? listOptions3;
  final String title;
  const CustomBottomSheet({
    Key? key,
    required this.heightBottomSheet,
    required this.itemObject,
    // required this.controller,
    // required this.onPressedDynamic,
    required this.listOptions1,
    this.listOptions2,
    this.listOptions3,
    this.title = 'Opciones de item seleccionado',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: heightBottomSheet),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: StyleUtils.P0_15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: listOptions1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: listOptions2 ?? [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: listOptions3 ?? [],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomSheetItem<O> extends StatelessWidget {
  final String title;
  final Icon icon;
  final O itemObject;
  final Function(O) onPressedDynamic;
  final Color color;
  const CustomBottomSheetItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.itemObject,
      required this.onPressedDynamic,
      this.color = SlgColors.azul_principal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              onPressed: () => onPressedDynamic(itemObject),
              icon: icon,
              color: SlgColors.blanco_principal,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(title)
        ],
      ),
    );
  }
}
