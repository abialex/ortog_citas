import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/style_utils.dart';
import '../../theme/app_colors.dart';

class CustomToggleList extends StatelessWidget {
  //si isMultiSelect = false, listBool debe contener solo 1 true
  final double heightBox;
  final bool isMultiSelect;
  final Axis direction;
  final List<RxBool> listBool;
  final List<String> listWords;
  final double left;
  final double top;
  final double botoom;
  final double fontSize;

  const CustomToggleList({
    super.key,
    this.heightBox = 30,
    this.isMultiSelect = false,
    this.direction = Axis.horizontal,
    required this.listBool,
    this.listWords = const ["default 1", "default 2"],
    this.left = 0,
    this.top = 15,
    this.botoom = 10,
    this.fontSize = 13,
  });
  @override
  Widget build(BuildContext context) {
    int oldIndex = -1;
    if (!isMultiSelect) {
      oldIndex = listBool.indexOf(true.obs);
    }

    return Obx(
      () => Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: EdgeInsets.fromLTRB(left, top, 0, botoom),
        child: ToggleButtons(
          constraints: BoxConstraints(minHeight: heightBox),
          direction: direction,
          borderRadius: BorderRadius.circular(10),

          isSelected: listBool
              .map((item) => item.value)
              .toList(), // list<Rx<bool>> cast list<bool>
          onPressed: (int index) {
            if (isMultiSelect) {
              listBool[index].value = !listBool[index].value;
            } else {
              if (oldIndex != -1) {
                //guardando la caja anterior seleccionado
                listBool[oldIndex].value = !listBool[oldIndex].value;
              }
              if (!listBool[index].value) {
                listBool[index].value = !listBool[index].value;
              }
              oldIndex = index;
            }
          },
          selectedColor: OrtogColors.white, //color del texto seleccionado
          fillColor:
              OrtogColors.ortog_color, //color background del seleccionado
          textStyle: const TextStyle(fontSize: StyleUtils.P0_15),
          selectedBorderColor: OrtogColors.ortog_color,
          borderColor: OrtogColors.ortog_color,
          children: List.generate(
            listWords.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                listWords[index],
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
