import 'package:ortog_citas/app/core/utils/style_utils.dart';
import 'package:ortog_citas/app/ui/global_widgets/labels/custom_label_form_001.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/app_colors.dart';

class CustomDropdownWidget<T> extends StatelessWidget {
  //if label is ""? sizedbox.shrink()
  //if onPressed is null? sizedbox.shrink()
  final EdgeInsets padding;
  final String label;
  final TextStyle styleLabel;
  final RxList<T> listItem;
  final Function(T) onChanged;
  final Function()? onPressed;
  final double height;
  final Icon icon;
  final int flexlabel;
  final int flexDropdown;
  final int flexIcon;

  const CustomDropdownWidget({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 2),
    this.label = "",
    this.styleLabel = const TextStyle(
        color: OrtogColors.dark,
        fontSize: StyleUtils.P1_14,
        fontWeight: FontWeight.w500),
    required this.listItem,
    required this.onChanged,
    this.onPressed,
    this.icon = const Icon(Icons.image),
    this.flexlabel = 2,
    this.flexDropdown = 5,
    this.flexIcon = 1,
    this.height = 38,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: flexDropdown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomLabelForm001(
                label: label,
                left: 5,
                top: 5,
              ),
              SizedBox(
                height: height,
                child: _DropDown<T>(
                  listItem: listItem,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: flexIcon,
          child: onPressed != null
              ? IconButton(
                  icon: icon,
                  onPressed: onPressed,
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}

class _DropDown<T> extends StatelessWidget {
  final List<T> listItem;
  final String? valueInitial;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle selectStyle;
  final TextStyle labelSelectStyle;
  final double iconSize;
  final Function(T) onChanged;

  const _DropDown({
    required this.listItem,
    this.valueInitial,
    this.hintText = "seleccionar...",
    this.hintStyle =
        const TextStyle(color: OrtogColors.dark, fontSize: StyleUtils.P3_12),
    this.labelSelectStyle =
        const TextStyle(color: OrtogColors.dark, fontSize: StyleUtils.P4_11),
    this.selectStyle =
        const TextStyle(color: OrtogColors.dark, fontSize: StyleUtils.P3_12),
    this.iconSize = 25,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: OrtogColors.dark),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(
        () => DropdownButtonFormField(
          //value: valueInitial,
          isExpanded: true,
          iconSize: iconSize,
          iconEnabledColor: OrtogColors.dark,
          icon: Icon(Icons.person),
          iconDisabledColor: OrtogColors.rojo,
          hint: Center(
            child: Text(
              hintText,
              style: hintStyle,
            ),
          ),
          style: selectStyle,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          items: listItem.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Center(
                child: Text(
                  item.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: labelSelectStyle,
                ),
              ),
            );
          }).toList(),
          onChanged: (dynamic value) {
            onChanged(value);
            //select.value = (value as T);
            //onChanged?.call();
          },
        ),
      ),
    );
  }
}
