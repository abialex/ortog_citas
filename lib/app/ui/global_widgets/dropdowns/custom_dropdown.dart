// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'custom_dropdown_controller.dart';
// import 'custon_dropdown_item.dart';

// class CustomDropdownButton<T> extends StatelessWidget {
//   // final List<T> items;
//   final CustomDropdownController<T>? controller;
//   final List<DropdownItem<T>> items;
//   final String hint;
//   final double width;
//   final double height;
//   final Color? borderColor;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final TextStyle? textStyle;
//   final EdgeInsetsGeometry? padding;
//   final EdgeInsetsGeometry? margin;
//   final ValueChanged<T>? onChanged;
//   final IconData? icon;

//   CustomDropdownButton({
//     this.controller,
//     required this.items,
//     required this.hint,
//     this.width = 100,
//     this.height = 45,
//     this.borderColor,
//     this.backgroundColor,
//     this.textColor,
//     this.textStyle,
//     this.padding,
//     this.margin,
//     this.onChanged,
//     this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: borderColor ?? Colors.grey,
//         ),
//       ),
//       padding: padding ?? EdgeInsets.symmetric(horizontal: 16),
//       margin: margin ?? EdgeInsets.zero,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Icon(
//               icon ?? Icons.arrow_drop_down,
//               color: Colors.grey[600],
//             ),
//           ),
//           Expanded(
//             child: Obx(
//               () => Text(
//                 controller!.selectedItem.value.label,
//                 style: TextStyle(
//                   color: textColor ?? Colors.black,
//                   fontSize: 16,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//               // DropdownButton<T>(
//               //   isExpanded: true,
//               //   value: controller?.selectedValue,
//               //   hint: Text(hint, style: textStyle),
//               //   items: items
//               //       .map(
//               //         (item) => DropdownMenuItem<T>(
//               //           value: item.value,
//               //           child: Text(
//               //             item.label,
//               //             style: textStyle,
//               //           ),
//               //         ),
//               //       )
//               //       .toList(),
//               //   onChanged: (value) {
//               //     if (controller != null) {
//               //       controller!.setSelectedValue(value);
//               //     }
//               //     onChanged?.call(value!);
//               //   },
//               // ),
//             ),
//           ),
//           SizedBox(width: 16),
//           DropdownButtonHideUnderline(
//             child: DropdownButton<DropdownItem<T>>(
//               value: controller!.selectedItem.value,
//               items: items.map((item) {
//                 return DropdownMenuItem<DropdownItem<T>>(
//                   value: item,
//                   child: Row(
//                     children: [
//                       if (item.icon != null)
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8),
//                           child: Icon(
//                             item.icon,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       Text(item.label),
//                     ],
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 controller!.setSelectedItem(value!);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
