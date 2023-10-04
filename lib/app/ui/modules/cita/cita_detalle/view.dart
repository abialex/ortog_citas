import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/buttons/custom_button_submit.dart';
import '../../../global_widgets/divider/custom_divider.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';

class CitaDetallePage extends GetWidget<CitaDetalleController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CitaDetalleController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: OrtognaticaColors.OrtogColor,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: Text(
                  "DETALLE CITA",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(flex: 2, child: SizedBox.shrink())
            ],
          ),
        ),
        body: SafeArea(
          top: false,
          child: Container(
            constraints: const BoxConstraints.expand(),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomDivider(
                                paddindTop: 15,
                                title: 'Datos de la cita',
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Fecha y Hora:",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label:
                                              "${_.fechaCitaCtrl.text} ${_.horaCtrl.text}",
                                          left: 5,
                                          top: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "",
                                          left: 5,
                                          top: 15,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: OrtognaticaColors.OrtogColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              print("lista de citas");
                                            },
                                            constraints: BoxConstraints(),
                                            icon:
                                                Icon(Icons.add_alert_outlined),
                                            color: OrtognaticaColors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Razón:",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label: _.razonCtrl.text,
                                          left: 5,
                                          top: 5,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Detalles de la cita:",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label:
                                              "Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente Próximamente  Próximamente",
                                          left: 5,
                                          top: 5,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              CustomDivider(
                                paddindTop: 15,
                                title: 'Datos del paciente',
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Paciente:",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label: _.pacienteCtrl.text,
                                          left: 5,
                                          top: 5,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Edad",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label: _.edadCtrl.text,
                                          left: 5,
                                          top: 5,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              CustomDivider(
                                paddindTop: 15,
                                title: 'Datos clínicos',
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Enfermedad Actual:",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label: _.enfermedadActualCtrl.text
                                                  .isEmpty
                                              ? "No tiene"
                                              : _.enfermedadActualCtrl.text,
                                          left: 5,
                                          top: 5,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Antecedentes:",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label: _.antecedentesCtrl.text.isEmpty
                                              ? "No tiene"
                                              : _.antecedentesCtrl.text,
                                          left: 5,
                                          top: 5,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          fontWeight: FontWeight.bold,
                                          label: "Motivo consulta:",
                                          left: 5,
                                          top: 15,
                                        ),
                                        CustomLabelForm001(
                                          label: _.motivoConsultaCtrl.text,
                                          left: 5,
                                          top: 5,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomButtonSubmit(
                              text: "Atras",
                              color: OrtognaticaColors.greyWhite,
                              margin: EdgeInsets.only(top: 5),
                              paggingInsetsButtonValue: 5,
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
