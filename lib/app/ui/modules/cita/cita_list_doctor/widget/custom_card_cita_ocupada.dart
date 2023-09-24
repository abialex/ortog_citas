import 'package:ortog_citas/app/data/models/cita/cita_item_model.dart';
import 'package:ortog_citas/app/data/models/cita/hora_model.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';

class CustomCardCitaOcupado extends StatelessWidget {
  final HoraModel itemHoraModel;

  const CustomCardCitaOcupado({
    super.key,
    required this.itemHoraModel,
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
                        "Ocupado",
                        style: TextStyle(
                            color: SlgColors.rojo, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
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
                                      itemHoraModel.razon ?? "Desconocido",
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: SlgColors.rojoLight),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
}
