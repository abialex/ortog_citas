import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/style_utils.dart';
import '../../../../../data/models/paciente/paciente_item_model.dart';
import '../../../../global_controllers/actionsUserController/llamada_controller.dart';
import '../../../../global_widgets/dropdown_bottom_sheet/custom_bottom_sheet.dart';
import '../../../../theme/app_colors.dart';

class CustomCardPersonaItemWidget extends StatelessWidget {
  final PacienteItemModel pacienteItem;
  final Function(PacienteItemModel) onUpdate;
  final Function(PacienteItemModel) onDetalle;
  const CustomCardPersonaItemWidget({
    super.key,
    required this.pacienteItem,
    required this.onUpdate,
    required this.onDetalle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: SlgColors.grey, width: 0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 75,
        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Text(
                              pacienteItem.tipodocAbrev + ":",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(pacienteItem.dni),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Row(
                          children: [
                            Text("CELULAR:",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              pacienteItem.celular?.isEmpty == true
                                  ? "S/CELULAR."
                                  : pacienteItem.celular ?? "S/CELULAR.",
                            ),
                          ],
                        ),
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        pacienteItem.denominacion,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Text(
                              "ESTADO:",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(pacienteItem.is_activeText,
                                style: TextStyle(
                                    color: pacienteItem.is_active
                                        ? SlgColors.green
                                        : SlgColors.rojo,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  pacienteItem.correo?.isEmpty == true
                                      ? "SIN CORREO"
                                      : pacienteItem.correo ?? "SIN CORREO",
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: -14,
              child: IconButton(
                onPressed: () => openBottomSheet(pacienteItem),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.more_vert,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  openBottomSheet(PacienteItemModel personaItem) {
    return Get.bottomSheet<String>(
        CustomBottomSheet(
          title: personaItem.denominacion,
          itemObject: personaItem,
          heightBottomSheet: StyleUtils.CUSTOM_BOTTOM_SHEET_1_ROW,
          listOptions1: [
            CustomBottomSheetItem(
              title: "Editar",
              icon: const Icon(Icons.edit),
              onPressedDynamic: onUpdate,
              itemObject: personaItem,
            ),
            CustomBottomSheetItem(
              title: "Detalle",
              icon: const Icon(Icons.remove_red_eye),
              onPressedDynamic: onDetalle,
              itemObject: personaItem,
            ),
            // CustomBottomSheetItem(
            //   title: "Eliminar",
            //   icon: const Icon(Icons.delete),
            //   onPressedDynamic: (p0) {},
            //   itemObject: personaItem,
            // ),
          ],
        ),
        isDismissible: true,
        backgroundColor: SlgColors.blanco_principal,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ));
  }

  openDeleteModal(PacienteItemModel personItem) {
    return Get.dialog(AlertDialog(
      icon: const Icon(Icons.delete),
      iconColor: Colors.red,
      title: const Text(
        '¿Está seguro de eliminar?',
        style: TextStyle(
          fontSize: StyleUtils.P2_13,
        ),
      ),
      content: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.person),
            Expanded(
              child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  '${personItem.denominacion}'),
            )
          ]),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey)),
                onPressed: () {
                  Get.back();
                },
                child: const Text('CANCELAR'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey)),
                child: const Text('ACEPTAR'),
                onPressed: () {
                  Get.back();
                  Get.back();
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
