import 'package:ortog_citas/app/data/models/cita/hora_model.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';

class CustomCardCitaLibre extends StatelessWidget {
  final HoraModel itemHoraModel;
  final Function(HoraModel) onChanged;
  final Function(HoraModel) onAddCitaOcupada;

  const CustomCardCitaLibre(
      {super.key,
      required this.itemHoraModel,
      required this.onChanged,
      required this.onAddCitaOcupada});

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
        height: 70,
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
                          "Libre",
                          style: TextStyle(
                              color: OrtogColors.ortog_color,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
            Positioned(
              right: 15,
              top: 15,
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
                      color: OrtogColors.greyWhite,
                      iconSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Visibility(
                    visible: itemHoraModel.isLibre,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        onAddCitaOcupada(itemHoraModel);
                      },
                      icon: Icon(Icons.lock_outline),
                      color: OrtogColors.greyWhite,
                      iconSize: 25,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
