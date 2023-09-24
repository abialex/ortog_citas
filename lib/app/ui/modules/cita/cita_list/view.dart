import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/style_utils.dart';
import '../../../../data/models/cita/cita_item_model.dart';
import '../../../../data/models/doctor/doctor_model.dart';
import '../../../global_widgets/buttons/custom_button_submit.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../global_widgets/dropdowns/dropdown01/custom_dropdown_form_field_001.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../global_widgets/toggle/toogle_producto_service.dart';
import '../../../theme/app_colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'controller.dart';
import 'widget/widgets.dart';

class Cita extends GetWidget<CitaListController> {
  //final citaController = Get.find<CitaController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CitaListController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: SlgColors.azul_principal,
          centerTitle: true,
          title: Text(
            "Citas",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        drawer: MenuPrincipal(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: SfDateRangePicker(
                            onSelectionChanged: (date) async {
                              _.startGetCitas(
                                  DateTime.parse(date.value.toString()));
                            },
                            selectionColor: SlgColors.SLGcolor,
                            todayHighlightColor: SlgColors.SLGcolor,
                            showTodayButton: true,
                            headerStyle: DateRangePickerHeaderStyle(
                              textAlign: TextAlign.left,
                              textStyle: TextStyle(
                                color: SlgColors.SLGcolor,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: SlgColors.SLGcolor,
                              value: _.progresIndicator.value,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Sugerencia",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.info)
                                  ],
                                ),
                                SizedBox(
                                  height: StyleUtils.SIZE_ROW_SPACE_5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "1. Puedes usar las flechas del teclado para navegar en las fechas"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: StyleUtils.SIZE_ROW_SPACE_5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "2. El botón TODAY(hoy) solo reinicia el calendario"),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomLabelForm001(
                                    label: "Doctor:",
                                    left: 10,
                                    top: 0,
                                  ),
                                  SizedBox(height: 5),
                                  CustomDropdownButtonFormField<DoctorModel>(
                                    validators: (s) {},
                                    items: _.doctorList,
                                    onChanged: _.getListHoraModelFilterByDoctor,
                                    value: _.doctorModelInit?.value,
                                    hintText: "seleccione un doctor(a)",
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Expanded(
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.stretch,
                        //         children: [
                        //           CustomLabelForm001(
                        //             label: 'Fecha y nombre del día:',
                        //             left: 10,
                        //             top: 10,
                        //           ),
                        //           CustomDatePicker002(
                        //             dateInit: _.dateInit.value,
                        //             onChangeDate: _.setFecha,
                        //             maximunYear: 2025,
                        //             minimunYear: 2021,
                        //             mode: CupertinoDatePickerMode.date,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Expanded(
                        //       flex: 5,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.stretch,
                        //         children: [
                        //           Obx(
                        //             () => CustomLabelForm001(
                        //               textSize: 20,
                        //               fontWeight: FontWeight.bold,
                        //               textAlign: TextAlign.center,
                        //               label: _.nombreDiaRx.value,
                        //               left: 5,
                        //               top: 10,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Expanded(
                        //       flex: 1,
                        //       child: Obx(
                        //         () => Visibility(
                        //           visible: !_.isVerificadoToday.value,
                        //           child: Column(
                        //             crossAxisAlignment: CrossAxisAlignment.stretch,
                        //             children: [
                        //               Container(
                        //                 margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        //                 decoration: BoxDecoration(
                        //                   color: SlgColors.azul_principal,
                        //                   borderRadius: BorderRadius.circular(10),
                        //                 ),
                        //                 child: IconButton(
                        //                   icon: Icon(Icons.update),
                        //                   onPressed: _.getListHoraModelFilterToday,
                        //                   color: SlgColors.white,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       flex: 1,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.stretch,
                        //         children: [
                        //           Container(
                        //             margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        //             decoration: BoxDecoration(
                        //               color: SlgColors.azul_principal,
                        //               borderRadius: BorderRadius.circular(10),
                        //             ),
                        //             child: IconButton(
                        //               icon: Obx(
                        //                 () => Icon(_.isVerificado.value
                        //                     ? Icons.search
                        //                     : Icons.saved_search_rounded),
                        //               ),
                        //               onPressed: _.getListHoraModelFilter,
                        //               color: SlgColors.white,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomToggleList(
                            top: 5,
                            heightBox: 25,
                            isMultiSelect: true,
                            listBool: _.listbool,
                            listWords: _.listTime,
                          ),
                        ),
                        Expanded(
                          child: Obx(() {
                            if (controller.citasIconStateProgress.value ==
                                ProgressState.oculto) {
                              return Visibility(
                                visible: _.isVerificado.value,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: _.horaList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Obx(() {
                                      late Widget card;
                                      if (_.horaList[index].isLibre) {
                                        card = CustomCardCitaLibre(
                                          onAddCitaOcupada:
                                              _.agregarCitaOcupada,
                                          onChanged: _.gotoCitaCreate,
                                          itemHoraModel: _.horaList[index],
                                        );
                                      } else {
                                        if (_.horaList[index].isOcupado) {
                                          card = CustomCardCitaOcupado(
                                            onChanged: _.gotoCitaCreate,
                                            onDeleteCitaOcupada:
                                                _.eliminarCitaOcupada,
                                            itemHoraModel: _.horaList[index],
                                          );
                                        } else {
                                          card = CustomCardCita(
                                            onUpdateCita: (citaItemModel) {
                                              _buildDialogAuxUpdateCita(
                                                  _, citaItemModel);
                                            },
                                            onCrearPacienteFromCita:
                                                _.gotoPacienteCreateFromCita,
                                            onDetalleCita: _.gotoCitaDetalle,
                                            onDeleteCita: _.eliminarCita,
                                            onChanged: _.gotoCitaCreate,
                                            itemHoraModel: _.horaList[index],
                                          );
                                        }
                                      }
                                      if (-1 == _.listbool.indexOf(true.obs)) {
                                        return card;
                                      } else {
                                        final isVisible =
                                            _.listbool[index].value;
                                        return (isVisible
                                            ? card
                                            : SizedBox.shrink());
                                      }
                                    });
                                  },
                                ),
                              );
                            } else
                              return Container(
                                child: const Center(
                                  child: CustomProgressIndicator(),
                                ),
                              );
                            ;
                          }),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Divider(
                              thickness: 0.5,
                              height: 1,
                              color: SlgColors.dark,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(flex: 3, child: Text("Clínica SLG")),
                                Expanded(
                                  flex: 8,
                                  child: Text(_.user.value.persona ?? "NN",
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Obx(() {
                if (controller.deleteCitaProgress.value ==
                    ProgressState.visible) {
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

  Future<dynamic> _buildDialogAuxUpdateCita(
      CitaListController citaListController, CitaItemModel citaItemModel) {
    TextEditingController textNombres = TextEditingController();
    TextEditingController textCelular = TextEditingController();
    TextEditingController textRazon = TextEditingController();
    textNombres.text = citaItemModel.citaRapidaNombrePaciente ?? "";
    textCelular.text = citaItemModel.citaRapidaCelular ?? "";
    textRazon.text = citaItemModel.razon ?? "";

    return Get.dialog(Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 200),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(child: SizedBox.shrink()),
                  Expanded(
                    child: Text(
                      "Modificando Cita Rápida",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.edit)))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //label nombres y apellidos
                  CustomLabelForm001(
                    label: "Modificar Nombres y Apellidos",
                    left: 5,
                    top: 10,
                  ),
                  TextFormFieldCustom001(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.transparent,
                    ),
                    hintText: "Nombres y Apellidos",
                    onChanged: (value) {},
                    validators: (va) {
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    inputFormat: InputFormatEnum.letras,
                    controller: textNombres,
                  ),
                  //celular
                  CustomLabelForm001(
                    label: "Modificar el Celular",
                    left: 5,
                    top: 10,
                  ),
                  TextFormFieldCustom001(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.transparent,
                    ),
                    hintText: "ingrese un celular",
                    onChanged: (value) {},
                    validators: (va) {
                      return null;
                    },
                    maxlength: 9,
                    keyboardType: TextInputType.name,
                    inputFormat: InputFormatEnum.numeros,
                    controller: textCelular,
                  ), //

                  //label razón
                  CustomLabelForm001(
                    label: "Modificar Motivo de la consulta",
                    left: 5,
                    top: 10,
                  ),
                  TextFormFieldCustom001(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.transparent,
                    ),
                    hintText: "Motivo la razón",
                    onChanged: (value) {},
                    validators: (va) {
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    inputFormat: InputFormatEnum.letras,
                    controller: textRazon,
                  ), //
                  Row(
                    children: [
                      Expanded(
                          child: CustomButtonSubmit(
                        onTap: () {
                          Get.back();
                        },
                        text: "CANCELAR",
                        paggingInsetsVerticalTextValue: 15,
                        color: SlgColors.greyWhite,
                      )),
                      Expanded(
                          child: CustomButtonSubmit(
                        onTap: () async {
                          citaItemModel = CitaItemModel(
                            idcita: citaItemModel.idcita ?? 0,
                            celular: citaItemModel.celular,
                            denominacion: citaItemModel.denominacion,
                            idpaciente: citaItemModel.idpaciente,
                            hora: citaItemModel.hora,
                            isCitaRapida: citaItemModel.isCitaRapida,
                            citaRapidaNombrePaciente: textNombres.text,
                            citaRapidaCelular: textCelular.text,
                            razon: textRazon.text,
                          );
                          Get.back();
                          Get.back();
                          bool result = await citaListController
                              .updateCita(citaItemModel);
                          // if (result) {
                          //   DialogController().showDialog001(
                          //     icon: Icons.edit,
                          //     title: "Modificado",
                          //     mensaje: "La cita rápida ha sido modificada",
                          //     twoOptions: false,
                          //     withTime: true,
                          //     seconds: 5,
                          //   );
                          // } else {
                          //   DialogController().showDialog001(
                          //     icon: Icons.info,
                          //     title: "No se modificó",
                          //     mensaje: "Problemas al modificar",
                          //     twoOptions: false,
                          //   );
                          // }
                        },
                        text: "MODIFICAR",
                        paggingInsetsButtonValue: 0,
                        paggingInsetsVerticalTextValue: 15,
                      ))
                    ],
                  )
                ],
              )
            ],
          )),
    ));
  }
}
