import 'package:flutter/material.dart';
import '../../../../../data/models/cita/hora_model.dart';
import '../../../../theme/app_colors.dart';

class CustomCardCitaLibre extends StatelessWidget {
  final HoraModel itemHoraModel;

  const CustomCardCitaLibre({
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
                          "Libre",
                          style: TextStyle(
                              color: SlgColors.azul_principal,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
