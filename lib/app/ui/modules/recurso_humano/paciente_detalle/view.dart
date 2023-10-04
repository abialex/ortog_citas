import 'package:ortog_citas/app/data/models/container/sede_model.dart';
import 'package:ortog_citas/app/data/models/contenedor_model.dart';
import 'package:ortog_citas/app/ui/global_widgets/buttons/custom_button_submit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/divider/custom_divider.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';

class PacienteDetallePage extends GetWidget<PacienteDetalleController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PacienteDetalleController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: OrtogColors.ortog_color,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Text(
                    "DETALLE PACIENTE",
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
          body: Obx(() {
            if (controller.loginIconState.value == ProgressState.oculto) {
              return Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomDivider(
                          paddindTop: 15,
                          title: 'Datos del Paciente',
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Nombres:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  CustomLabelForm001(
                                    label: _.nombresCtrl.text,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Apellido Paterno:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.apPaternoCtrl.text,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Apellido Materno:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.apMaternoCtrl.text,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Género:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.generoCtrl.text,
                                    left: 5,
                                    top: 5,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Ocupación:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.ocupacionCtrl.text,
                                    left: 5,
                                    top: 5,
                                  ),
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Fecha de nacimiento:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.fechaNacimientoCtrl.text,
                                    left: 5,
                                    top: 5,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Tipo documento:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.tipoDocumentoCtrl.text,
                                    left: 5,
                                    top: 5,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Número doc.",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.numDocCtrl.text,
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
                          title: 'Datos de contacto',
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Celular:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.celularCtrl.text.isEmpty
                                        ? "N/A"
                                        : _.celularCtrl.text,
                                    left: 5,
                                    top: 5,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Correo:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.correoCtrl.text.isEmpty
                                        ? "N/A"
                                        : _.correoCtrl.text,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Domicilio:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.domicilioCtrl.text.isEmpty
                                        ? "N/A"
                                        : _.domicilioCtrl.text,
                                    left: 5,
                                    top: 5,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Lugar de procedencia:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.lugarProcedenciaCtrl.text.isEmpty
                                        ? "N/A"
                                        : _.lugarProcedenciaCtrl.text,
                                    left: 5,
                                    top: 15,
                                  )
                                ],
                              ),
                            ),
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    fontWeight: FontWeight.bold,
                                    label: "Enfermedad Actual:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomLabelForm001(
                                    label: _.enfermedadActualCtrl.text.isEmpty
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomButtonSubmit(
                                text: "Atras",
                                color: OrtogColors.greyWhite,
                                paggingInsetsButtonValue: 15,
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
                ),
              );
            } else {
              return Container(
                child: const Center(
                  child: CustomProgressIndicator(),
                ),
              );
            }
          }));
    });
  }
}
