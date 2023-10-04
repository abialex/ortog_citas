import 'package:ortog_citas/app/data/models/cita/cita_rapida_item_model.dart';
import 'package:ortog_citas/app/ui/global_controllers/dialog_controller.dart';
import '../../../../theme/app_colors.dart';
import 'package:ortog_citas/app/ui/global_controllers/actionsUserController/llamada_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/style_utils.dart';
import '../../../../global_widgets/dropdown_bottom_sheet/custom_bottom_sheet.dart';

class CustomCardCita extends StatelessWidget {
  final CitaRapidaItemModel itemCitaFiltered;
  final Function(CitaRapidaItemModel) onPressedDescartar;
  final Function(CitaRapidaItemModel) onPressedActualizar;
  const CustomCardCita(
      {super.key,
      required this.itemCitaFiltered,
      required this.onPressedActualizar,
      required this.onPressedDescartar});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: OrtogColors.grey, width: 0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.date_range_rounded),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        itemCitaFiltered.fechaCita,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.timer_outlined),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        itemCitaFiltered.hora,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.personal_injury_outlined),
                    ),
                    Expanded(
                      flex: 9,
                      child: Text(
                        itemCitaFiltered.citaRapidaNombrePaciente ?? "N.A",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.question_mark_rounded)),
                    Expanded(
                      flex: 9,
                      child: Text(
                        itemCitaFiltered.razon,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              right: 0,
              top: 15,
              child: Column(
                children: [
                  Visibility(
                    visible: !itemCitaFiltered.isOcupado,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        openBottomSheetCitaFiltered(itemCitaFiltered);
                      },
                      icon: Icon(Icons.more_vert),
                      color: OrtogColors.greyWhite,
                      iconSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  openBottomSheetCitaFiltered(CitaRapidaItemModel citaItemFiltered) {
    return Get.bottomSheet<String>(
        CustomBottomSheet(
          title: citaItemFiltered.citaRapidaNombrePaciente ?? "SIN NOMBRE",
          itemObject: citaItemFiltered,
          heightBottomSheet: StyleUtils.CUSTOM_BOTTOM_SHEET_1_ROW,
          listOptions1: [
            CustomBottomSheetItem(
              title: "Actualizar",
              icon: const Icon(Icons.upload_outlined),
              onPressedDynamic: onPressedActualizar,
              itemObject: citaItemFiltered,
            ),
            citaItemFiltered.citaRapidaCelular != null
                ? CustomBottomSheetItem(
                    title: "Llamar",
                    icon: const Icon(Icons.phone),
                    onPressedDynamic: (s) {
                      LlamadasController().llamarCelular(
                          celular: citaItemFiltered.citaRapidaCelular);
                    },
                    itemObject: citaItemFiltered,
                  )
                : CustomBottomSheetItem(
                    color: OrtogColors.rojoLight,
                    title: "Sin Celular",
                    icon: const Icon(Icons.phonelink_erase_outlined),
                    onPressedDynamic: (s) {},
                    itemObject: citaItemFiltered,
                  ),
            CustomBottomSheetItem(
              title: "Eliminar",
              icon: const Icon(Icons.delete),
              onPressedDynamic: (p0) {
                DialogController().showDialog001(
                    title: "Eliminar Cita ",
                    mensaje:
                        "¿ Eliminar a ${citaItemFiltered.citaRapidaNombrePaciente} ?",
                    icon: Icons.delete,
                    onTapRight: () {
                      onPressedDescartar(citaItemFiltered);
                    });
              },
              itemObject: citaItemFiltered,
            ),
          ],
        ),
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ));
  }
}
