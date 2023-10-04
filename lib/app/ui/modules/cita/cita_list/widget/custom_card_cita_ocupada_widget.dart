import 'package:flutter/material.dart';
import '../../../../../data/models/cita/hora_model.dart';
import '../../../../theme/app_colors.dart';

class CustomCardCitaOcupado extends StatelessWidget {
  final HoraModel itemHoraModel;
  final Function(HoraModel) onChanged;
  final Function(HoraModel) onDeleteCitaOcupada;

  const CustomCardCitaOcupado(
      {super.key,
      required this.itemHoraModel,
      required this.onChanged,
      required this.onDeleteCitaOcupada});

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
        height: 50,
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
                              color: OrtognaticaColors.rojo,
                              fontWeight: FontWeight.bold),
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
                                            color: OrtognaticaColors.rojoLight),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
            Positioned(
              right: 15,
              top: 20,
              child: Column(
                children: [
                  Visibility(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.lock_open),
                      onPressed: () {
                        onDeleteCitaOcupada(itemHoraModel);
                      },
                      iconSize: 25,
                      color: OrtognaticaColors.greyWhite,
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
}
