import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/style_utils.dart';
import '../../../../../data/models/cita/cita_item_model.dart';
import '../../../../../data/models/cita/hora_model.dart';
import '../../../../global_widgets/divider/custom_divider.dart';
import '../../../../global_widgets/dropdown_bottom_sheet/custom_bottom_sheet.dart';
import '../../../../theme/app_colors.dart';

class CustomCardCita extends StatelessWidget {
  final HoraModel itemHoraModel;
  final Function(CitaItemModel) onNavigate1;
  final Function(CitaItemModel) onNavigate2;

  const CustomCardCita({
    super.key,
    required this.itemHoraModel,
    required this.onNavigate1,
    required this.onNavigate2,
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
                            color: SlgColors.azulDark,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List.generate(itemHoraModel.listCitas.length,
                            (index) {
                          CitaItemModel citaItem =
                              itemHoraModel.listCitas[index];
                          return Column(
                            children: [
                              CustomDivider(
                                  visibility: false,
                                  title: "",
                                  color: SlgColors.azulDark,
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
                                                          "Sin nombre cita rapida"
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
                                                  citaItem.razon ?? "Sin razon",
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
                                    child: Visibility(
                                      visible: !citaItem.isCitaRapida,
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          openBottomSheetCita(citaItem);
                                        },
                                        icon: Icon(Icons.more_vert),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  openBottomSheetCita(CitaItemModel citaItem) {
    return Get.bottomSheet<String>(
        CustomBottomSheet(
          title: citaItem.denominacion ?? "404 - Error",
          itemObject: citaItem,
          heightBottomSheet: StyleUtils.CUSTOM_BOTTOM_SHEET_1_ROW,
          listOptions1: [
            CustomBottomSheetItem(
              title: "Ver Cita",
              icon: const Icon(Icons.remove_red_eye_outlined),
              onPressedDynamic: onNavigate2,
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
          title:
              (citaItem.citaRapidaNombrePaciente ?? "Sin nombre").toUpperCase(),
          itemObject: citaItem,
          heightBottomSheet: StyleUtils.CUSTOM_BOTTOM_SHEET_1_ROW,
          listOptions1: [
            CustomBottomSheetItem(
              title: "----",
              icon: const Icon(Icons.remove_red_eye_outlined),
              onPressedDynamic: onNavigate2,
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
