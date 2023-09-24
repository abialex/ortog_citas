import 'package:ortog_citas/app/data/models/contenedor_model.dart';
import 'package:ortog_citas/app/ui/global_widgets/buttons/custom_button_submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/date_pickers/custom_date_picker_002.dart';
import '../../../global_widgets/divider/custom_divider.dart';
import '../../../global_widgets/dropdowns/dropdown01/custom_dropdown_form_field_001.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';

class PacienteUpdatePage extends GetWidget<PacienteUpdateController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PacienteUpdateController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: SlgColors.azul_principal,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Text(
                    "UPDATE PACIENTE",
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
                                    label: "Nombres:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    controller: _.nombresCtrl,
                                    icon: Icon(Icons.people),
                                    hintText: "Ingrese un nombre",
                                    onChanged: _.setNombres,
                                    validators: _.nombresValidators,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
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
                                    label: "Apellido Paterno:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    controller: _.apPaternoCtrl,
                                    icon: Icon(
                                      Icons.question_mark,
                                      color: Colors.transparent,
                                    ),
                                    hintText: "Ingrese una apellido paterno",
                                    onChanged: _.setApellidoPaterno,
                                    validators: _.apellidoPaternoValidators,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
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
                                    label: "Apellido Materno:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    controller: _.apMaternoCtrl,
                                    icon: Icon(
                                      Icons.question_mark,
                                      color: Colors.transparent,
                                    ),
                                    hintText: "Ingrese una apellido materno",
                                    onChanged: _.setApellidoMaterno,
                                    validators: _.apellidoMaternoValidators,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
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
                                    label: "Género:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  CustomDropdownButtonFormField<
                                      ContenedorModel>(
                                    value: _.generoInit?.value,
                                    hintText: "seleccionar",
                                    items: _.contenedorTipoGenero,
                                    onChanged: _.setTipoGenero,
                                    validators: _.tipoGeneroValidators,
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    label: "Ocupación:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  CustomDropdownButtonFormField<
                                      ContenedorModel>(
                                    value: _.ocupacionInit?.value,
                                    items: _.contenedorTipoOcupacion,
                                    hintText: "seleccionar",
                                    onChanged: _.setTipoOcupacion,
                                    validators: _.tipoOcupacionValidators,
                                    height: 25,
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
                                    label: "Fecha de nacimiento:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  CustomDatePicker002(
                                    dateInit: _.selectDate.value,
                                    onChangeDate: _.setFechaNacimiento,
                                    maximunYear: DateTime.now().year,
                                    minimunYear: 1900,
                                    mode: CupertinoDatePickerMode.date,
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
                                    label: "Tipo documento:",
                                    left: 5,
                                    top: 15,
                                  ),
                                  CustomDropdownButtonFormField<
                                      ContenedorModel>(
                                    value: _.tipoDocInit?.value,
                                    items: _.contenedorTipoDocumento,
                                    hintText: "seleccionar",
                                    onChanged: _.setTipoDocumento,
                                    validators: _.tipoDocumentoValidators,
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    label: "Número doc.",
                                    left: 5,
                                    top: 15,
                                  ),
                                  TextFormFieldCustom001(
                                    maxlength: 8,
                                    controller: _.numDocCtrl,
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.transparent,
                                    ),
                                    hintText: "Número doc.",
                                    onChanged: _.setNumDocumento,
                                    validators: _.numDocValidators,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
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
                                    label: "Celular:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    maxlength: 9,
                                    controller: _.celularCtrl,
                                    icon: Icon(Icons.phone),
                                    hintText: "celular:",
                                    onChanged: _.setCelular,
                                    validators: (p0) {},
                                    keyboardType: TextInputType.number,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    label: "Correo:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    controller: _.correoCtrl,
                                    icon: Icon(Icons.email_sharp),
                                    hintText: "ejemplo@gmail.com",
                                    onChanged: _.setCorreo,
                                    validators: _.correoValidators,
                                    keyboardType: TextInputType.emailAddress,
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
                                    label: "Domicilio:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    controller: _.domicilioCtrl,
                                    icon: Icon(Icons.home),
                                    hintText: "Ingrese un domicilio",
                                    onChanged: _.setDomicilio,
                                    validators: (p0) {},
                                    keyboardType: TextInputType.text,
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
                                    label: "Lugar de procedencia:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    controller: _.lugarProcedenciaCtrl,
                                    icon: Icon(Icons.home),
                                    hintText: "Huanta, La Mar, Huamanga etc",
                                    onChanged: _.setLugarProcedencia,
                                    validators: (p0) {},
                                    keyboardType: TextInputType.text,
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
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Expanded(
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.stretch,
                        //         children: [
                        //           CustomLabelForm001(
                        //             label: "Enfermedad Actual:",
                        //             left: 5,
                        //             top: 5,
                        //           ),
                        //           TextFormFieldCustom001(
                        //             controller: _.enfermedadActualCtrl,
                        //             icon: Icon(
                        //               Icons.question_mark,
                        //               color: Colors.transparent,
                        //             ),
                        //             hintText: "Ingrese una enfermedad actual",
                        //             onChanged: _.setEnfermedadActual,
                        //             validators: (p) {},
                        //             keyboardType: TextInputType.text,
                        //             textInputAction: TextInputAction.next,
                        //           )
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Expanded(
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.stretch,
                        //         children: [
                        //           CustomLabelForm001(
                        //             label: "Antecedentes:",
                        //             left: 5,
                        //             top: 5,
                        //           ),
                        //           TextFormFieldCustom001(
                        //             controller: _.antecedentesCtrl,
                        //             icon: Icon(
                        //               Icons.question_mark,
                        //               color: Colors.transparent,
                        //             ),
                        //             hintText:
                        //                 "Diabetes, Presión alta, Hepatitis, etc",
                        //             onChanged: _.setAntecendes,
                        //             validators: (p) {},
                        //             keyboardType: TextInputType.text,
                        //             textInputAction: TextInputAction.next,
                        //           )
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    label: "Motivo consulta:",
                                    left: 5,
                                    top: 5,
                                  ),
                                  TextFormFieldCustom001(
                                    controller: _.motivoConsultaCtrl,
                                    icon: Icon(
                                      Icons.question_mark,
                                      color: Colors.transparent,
                                    ),
                                    hintText: "Ingrese un motivo de consulta",
                                    onChanged: _.setMotivoConsulta,
                                    validators: _.motivoConsultaValidators,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
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
                                text: "Cancelar",
                                color: SlgColors.greyWhite,
                                paggingInsetsButtonValue: 5,
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomButtonSubmit(
                                text: "Guardar",
                                paggingInsetsButtonValue: 5,
                                onTap: () {
                                  _.submit(formKey);
                                },
                              ),
                            )
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
