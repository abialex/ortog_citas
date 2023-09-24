import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../data/models/cita/hora_model.dart';
import '../../../../theme/app_colors.dart';

class CustomCardCita extends StatelessWidget {
  final HoraModel itemHoraModel;
  const CustomCardCita({super.key, required this.itemHoraModel});

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
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    itemHoraModel.horaString,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
                flex: 6,
                child: itemHoraModel.isLibre
                    ? Column(
                        children: [
                          Text(
                            "Libre",
                            style: TextStyle(
                                color: SlgColors.azul_principal,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Expanded(flex: 4, child: SizedBox.shrink()),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {},
                                  icon: Icon(Icons.lock_outline),
                                  color: SlgColors.rojoLight,
                                  iconSize: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : itemHoraModel.isOcupado
                        ? Column(
                            children: [
                              Text(
                                "Ocupado",
                                style: TextStyle(
                                    color: SlgColors.rojo,
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
                                              itemHoraModel.razon ??
                                                  "Desconocido",
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
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        icon: Icon(Icons.lock_open),
                                        onPressed: () {},
                                        iconSize: 20,
                                        color: Color.fromARGB(255, 13, 136, 85),
                                      ))
                                ],
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                itemHoraModel.sede,
                                style: TextStyle(
                                    color: SlgColors.azulDark,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: List.generate(
                                  itemHoraModel.listCitas.length,
                                  (index) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: IconButton(
                                                      iconSize: 18,
                                                      constraints:
                                                          BoxConstraints(),
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.person_pin,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Text(
                                                      itemHoraModel
                                                              .listCitas[index]
                                                              .denominacion ??
                                                          "Sin razón",
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
                                                      itemHoraModel
                                                              .listCitas[index]
                                                              .razon ??
                                                          "Sin razón",
                                                      textAlign: TextAlign.left,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                                      itemHoraModel
                                                          .listCitas[index]
                                                          .hora,
                                                      textAlign: TextAlign.left,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                          onPressed: () {},
                                          color: SlgColors.rojoLight,
                                          icon: Icon(Icons.delete),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
          ],
        ),
      ),
    );
  }
}
