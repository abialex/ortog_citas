import '../../../../../data/models/cita/cita_item_model.dart';
import '../../../../../data/models/cita/hora_model.dart';
import '../../../../global_controllers/dialog_controller.dart';
import '../../../../global_widgets/divider/custom_divider.dart';
import '../../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/style_utils.dart';
import '../../../../global_widgets/dropdown_bottom_sheet/custom_bottom_sheet.dart';

class CustomCardCita extends StatelessWidget {
  final HoraModel itemHoraModel;
  final Function(HoraModel) onChanged;
  final Function(CitaItemModel) onDetalleCita;
  final Function(CitaItemModel) onDeleteCita;
  final Function(CitaItemModel) onCrearPacienteFromCita;
  final Function(CitaItemModel) onUpdateCita;
  const CustomCardCita({
    super.key,
    required this.itemHoraModel,
    required this.onChanged,
    required this.onDeleteCita,
    required this.onDetalleCita,
    required this.onUpdateCita,
    required this.onCrearPacienteFromCita,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: OrtognaticaColors.grey, width: 0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 10, 15),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: RotatedBox(
                    quarterTurns: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        itemHoraModel.horaString,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(
                        itemHoraModel.sede,
                        style: TextStyle(
                            color: OrtognaticaColors.azulDark,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List.generate(
                          itemHoraModel.listCitas.length,
                          (index) {
                            CitaItemModel citaItem =
                                itemHoraModel.listCitas[index];
                            return Column(
                              children: [
                                CustomDivider(
                                    visibility: false,
                                    title: "",
                                    color: OrtognaticaColors.azulDark,
                                    paddindRigth: 0,
                                    paddindTop: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons.person_pin,
                                                    size: 18,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    citaItem.isCitaRapida
                                                        ? citaItem
                                                                .citaRapidaNombrePaciente ??
                                                            "Sin nombre cita simple"
                                                        : (citaItem
                                                                .denominacion ??
                                                            "sin denominación"),
                                                    textAlign: TextAlign.left,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              top: 5,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons.question_mark,
                                                    size: 15,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    citaItem.razon ??
                                                        "Sin razón",
                                                    textAlign: TextAlign.left,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons.alarm,
                                                    size: 15,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    citaItem.hora,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          if (citaItem.isCitaRapida) {
                                            openBottomSheetCitaRapida(citaItem);
                                          } else {
                                            openBottomSheetCita(citaItem);
                                          }
                                        },
                                        icon: Icon(Icons.more_vert),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 15,
              top: 10,
              child: Column(
                children: [
                  Visibility(
                    visible: !itemHoraModel.isOcupado,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        onChanged(itemHoraModel);
                      },
                      icon: Icon(Icons.person_add_alt_1),
                      color: OrtognaticaColors.greyWhite,
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

  openBottomSheetCita(CitaItemModel citaItem) {
    return Get.bottomSheet<String>(
        CustomBottomSheet(
          title: citaItem.denominacion ?? "N.A",
          itemObject: citaItem,
          heightBottomSheet: StyleUtils.CUSTOM_BOTTOM_SHEET_1_ROW,
          listOptions1: [
            CustomBottomSheetItem(
              title: "Ver Detalle",
              icon: const Icon(Icons.remove_red_eye_outlined),
              onPressedDynamic: onDetalleCita,
              itemObject: citaItem,
            ),
            citaItem.celular != null
                ? CustomBottomSheetItem(
                    title: "Llamar",
                    icon: const Icon(Icons.phone),
                    onPressedDynamic: (citaitem) {
                      DialogController().showDialog001(
                          title: "Celular:",
                          mensaje: citaItem.celular ??
                              "el sistema tiene registrado celular pero no se muestra");
                      // LlamadasController();
                      //.llamarCelular(celular: citaItem.celular); is not pc
                    },
                    itemObject: citaItem,
                  )
                : CustomBottomSheetItem(
                    color: OrtognaticaColors.rojoLight,
                    title: "Sin Celular",
                    icon: const Icon(Icons.phonelink_erase_outlined),
                    onPressedDynamic: (s) {},
                    itemObject: citaItem,
                  ),
            CustomBottomSheetItem(
              title: "Eliminar",
              icon: const Icon(Icons.delete),
              onPressedDynamic: (p0) {
                DialogController().showDialog001(
                    title: "Eliminar Cita ",
                    mensaje: "¿ Eliminar a ${citaItem.denominacion} ?",
                    icon: Icons.delete,
                    onTapRight: () {
                      onDeleteCita(citaItem);
                    });
              },
              itemObject: citaItem,
            ),
          ],
        ),
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ));
  }

  openBottomSheetCitaRapida(CitaItemModel citaItem) {
    return Get.bottomSheet<String>(
        CustomBottomSheet(
          title: citaItem.citaRapidaNombrePaciente ??
              "Sin nombre en la cita rápida",
          itemObject: citaItem,
          heightBottomSheet: StyleUtils.CUSTOM_BOTTOM_SHEET_1_ROW,
          listOptions1: [
            CustomBottomSheetItem(
              title: "Modificar",
              icon: const Icon(Icons.edit),
              onPressedDynamic: onUpdateCita,
              itemObject: citaItem,
            ),
            CustomBottomSheetItem(
              title: "Registrar este paciente",
              icon: const Icon(Icons.person_add_alt_sharp),
              onPressedDynamic: onCrearPacienteFromCita,
              itemObject: citaItem,
            ),
            citaItem.citaRapidaCelular != null
                ? CustomBottomSheetItem(
                    title: "Llamar",
                    icon: const Icon(Icons.phone),
                    onPressedDynamic: (s) {
                      DialogController().showDialog001(
                          icon: Icons.phone,
                          title: "Celular:",
                          twoOptions: false,
                          mensaje: citaItem.citaRapidaCelular ??
                              "el sistema tiene registrado celular pero no se muestra");
                      // LlamadasController()
                      //     .llamarCelular(celular: citaItem.citaRapidaCelular);
                    },
                    itemObject: citaItem,
                  )
                : CustomBottomSheetItem(
                    color: OrtognaticaColors.rojoLight,
                    title: "Sin Celular",
                    icon: const Icon(Icons.phonelink_erase_outlined),
                    onPressedDynamic: (s) {},
                    itemObject: citaItem,
                  ),
            CustomBottomSheetItem(
              title: "Eliminar",
              icon: const Icon(Icons.delete),
              onPressedDynamic: (p0) {
                DialogController().showDialog001(
                    title: "Eliminar Cita Rápida",
                    mensaje:
                        "¿Eliminar a ${citaItem.citaRapidaNombrePaciente}?",
                    icon: Icons.delete,
                    onTapRight: () {
                      onDeleteCita(citaItem);
                    });
              },
              itemObject: citaItem,
            ),
          ],
        ),
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ));
  }
}
