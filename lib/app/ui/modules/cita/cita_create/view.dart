import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/container/sede_model.dart';
import '../../../global_widgets/buttons/custom_button_submit.dart';
import '../../../global_widgets/divider/custom_divider.dart';
import '../../../global_widgets/dropdowns/dropdown01/custom_dropdown_form_field_001.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../global_widgets/toggle/toogle_producto_service.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';

class CitaCreate extends GetWidget<CitaCreateController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CitaCreateController>(builder: (_) {
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
                  "CREAR CITA",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(flex: 1, child: SizedBox.shrink())
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomDivider(
                        paddindTop: 15,
                        title: 'Horario, doctor y sede',
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomLabelForm001(
                                  label: "Fecha de la cita:",
                                  left: 5,
                                  top: 16,
                                ),
                                TextFormFieldCustom001(
                                  controller: _.fechaCitaCtrl,
                                  isEnabled: false,
                                  textAlign: TextAlign.center,
                                  icon: Icon(Icons.calendar_month),
                                  hintText: "",
                                  onChanged: (p0) {},
                                  validators: (p0) {},
                                  keyboardType: TextInputType.none,
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
                                  label: "Doctor:",
                                  left: 5,
                                  top: 5,
                                ),
                                TextFormFieldCustom001(
                                  textAlign: TextAlign.center,
                                  controller: _.doctorCtrl,
                                  isEnabled: false,
                                  icon: Icon(Icons.person_outline_sharp),
                                  hintText: "",
                                  onChanged: (p0) {},
                                  validators: (p0) {},
                                  keyboardType: null,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Obx(
                        () => Visibility(
                          visible: _.isCita.value || _.isCitaRapida.value,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    CustomLabelForm001(
                                      label: "Sede:",
                                      left: 5,
                                      top: 5,
                                    ),
                                    CustomDropdownButtonFormField<SedeModel>(
                                      value: _.sedeModelInit?.value,
                                      items: _.sedeList,
                                      hintText: "selecciona una Sede",
                                      onChanged: _.setSede,
                                      validators: _.sedeValidators,
                                      height: 25,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomLabelForm001(
                                  label: "Hora:",
                                  left: 5,
                                  top: 5,
                                ),
                                TextFormFieldCustom001(
                                  textAlign: TextAlign.center,
                                  isEnabled: false,
                                  hintText: '',
                                  keyboardType: null,
                                  onChanged: (String) {},
                                  validators: (String) {},
                                  icon: Icon(Icons.alarm),
                                  controller: _.horaCtrl,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomLabelForm001(
                                  label: "Minuto:",
                                  left: 5,
                                  top: 5,
                                ),
                                TextFormFieldCustom001(
                                  maxlength: 2,
                                  textAlign: TextAlign.center,
                                  hintText: '00',
                                  keyboardType: TextInputType.number,
                                  inputFormat: InputFormatEnum.numeros,
                                  onChanged: _.setHora,
                                  validators: _.minutoValidators,
                                  icon: Icon(Icons.alarm_on),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      CustomDivider(
                        paddindTop: 15,
                        title: 'Datos de la cita',
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.zero,
                              child: CustomToggleList(
                                top: 10,
                                botoom: 5,
                                listBool: _.isLibre
                                    ? [
                                        false.obs,
                                        _.isCita,
                                        _.isCitaRapida,
                                      ]
                                    : [_.isCita, _.isCitaRapida],
                                listWords: _.isLibre
                                    ? [
                                        "OCUPADO",
                                        "      CITA      ",
                                        "CITA RÁPIDA"
                                      ]
                                    : ["      CITA      ", "CITA RÁPIDA"],
                                isMultiSelect: false,
                              ),
                            ),
                          )
                        ],
                      ),
                      Obx(
                        () => Column(
                          children: [
                            Visibility(
                              visible: _.isCita.value,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const CustomLabelForm001(
                                          label: 'Número de Documento:',
                                          left: 5,
                                          top: 5,
                                        ),
                                        TextFormFieldCustom001(
                                          maxlength: 8,
                                          controller: _.dniCtrl,
                                          icon:
                                              Icon(Icons.description_outlined),
                                          hintText: 'Ingrese DNI',
                                          keyboardType: TextInputType.number,
                                          inputFormat: InputFormatEnum.numeros,
                                          onChanged: (String s) {},
                                          validators: _.dniValidators,
                                          textInputAction: null,
                                          //value: 22,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const CustomLabelForm001(
                                            label: '',
                                            left: 5,
                                            top: 10,
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      SlgColors.azul_principal,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: IconButton(
                                                constraints: BoxConstraints(),
                                                onPressed: _.getPacienteByDni,
                                                icon: Icon(Icons.search),
                                                color: SlgColors.white,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const CustomLabelForm001(
                                            label: '',
                                            left: 5,
                                            top: 10,
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      SlgColors.azul_principal,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: IconButton(
                                                constraints: BoxConstraints(),
                                                onPressed: _.gotoPacienteCreate,
                                                icon: Icon(Icons.person_add),
                                                color: SlgColors.white,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _.isCita.value,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          label: "Paciente:",
                                          left: 5,
                                          top: 5,
                                        ),
                                        TextFormFieldCustom001(
                                          isEnabled: false,
                                          controller: _.pacienteCtrl,
                                          icon: Icon(Icons.person_add_alt),
                                          hintText: "",
                                          onChanged: (p0) {},
                                          validators: (p0) {},
                                          keyboardType: TextInputType.text,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _.isCitaRapida.value,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          label: "Nombre del paciente:",
                                          left: 5,
                                          top: 5,
                                        ),
                                        TextFormFieldCustom001(
                                          //controller: _.pacienteCtrl,
                                          icon: Icon(Icons.person_add_alt),
                                          hintText:
                                              "Ingrese nombres del paciente",
                                          onChanged:
                                              _.setCitaRapidaNombrePaciente,
                                          validators:
                                              _.pacienteNombreValidators,
                                          keyboardType: TextInputType.text,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _.isCitaRapida.value,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        CustomLabelForm001(
                                          label: "Celular:",
                                          left: 5,
                                          top: 5,
                                        ),
                                        TextFormFieldCustom001(
                                          maxlength: 9,
                                          icon: Icon(Icons.phone),
                                          hintText: "Ingrese celular",
                                          onChanged: _.setCitaRapidaCelular,
                                          validators: (p0) {},
                                          keyboardType: TextInputType.number,
                                          inputFormat: InputFormatEnum.numeros,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomLabelForm001(
                                  label: "Razón:",
                                  left: 5,
                                  top: 5,
                                ),
                                TextFormFieldCustom001(
                                  icon: Icon(Icons.question_mark),
                                  hintText: "Ingrese una razón",
                                  onChanged: _.setRazon,
                                  validators: _.razonValidators,
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
                              onTap: _.gotoBackCancel,
                            ),
                          ),
                          Expanded(
                            child: CustomButtonSubmit(
                              text: "Agregar",
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
            ),
            Positioned.fill(
              child: Obx(() {
                if (controller.loginIconState.value == ProgressState.visible) {
                  return Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CustomProgressIndicator(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            )
          ],
        ),
      );
    });
  }
}
