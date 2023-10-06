import 'package:ortog_citas/app/data/models/notification/notification_model.dart';
import 'package:ortog_citas/app/ui/global_widgets/buttons/custom_button_submit.dart';

import '../../../../data/models/doctor/doctor_model.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../global_widgets/dropdowns/dropdown01/custom_dropdown_form_field_001.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/textFields/custom_text_area.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotificacionesPage extends GetWidget<NotificacionesController> {
  //controller ya está instanciado con sus métodos
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificacionesController>(builder: (_) {
      DoctorModel? doctor;
      String mensaje = "";
      String titulo = "";

      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Notificaciones"),
            backgroundColor: OrtognaticaColors.OrtogColor),
        drawer: MenuPrincipal(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomLabelForm001(
                                label: "Doctor para enviar",
                                left: 5,
                                top: 10,
                              ),
                              CustomDropdownButtonFormField<DoctorModel>(
                                validators: (s) {
                                  return null;
                                },
                                items: _.doctorList,
                                onChanged: (value) {
                                  doctor = value;
                                },
                                //value: _.doctorModelInit?.value,
                                hintText: "seleccione un doctor(a)",
                                height: 25,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomLabelForm001(
                                label: "Título",
                                left: 5,
                                top: 10,
                              ),
                              TextFormFieldCustom001(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.transparent,
                                ),
                                hintText: "Escriba un titulo",
                                onChanged: (value) {
                                  titulo = value;
                                },
                                validators: (va) {
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                inputFormat: InputFormatEnum.letras,
                                // controller: Tex,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomLabelForm001(
                                label: "Mensaje",
                                left: 5,
                                top: 10,
                              ),
                              CustomTextArea(
                                controller: TextEditingController(),
                                hintText: "Mensaje",
                                onChanged: (value) {
                                  mensaje = value;
                                },
                                validators: (va) {
                                  return null;
                                },

                                // controller: Tex,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonSubmit(
                            onTap: () {
                              controller.sendNotification(
                                NotificationModel(
                                  user_id: doctor?.usuario_id ?? 0,
                                  title: titulo,
                                  message: mensaje,
                                  data: {},
                                ),
                              );
                            },
                            paggingInsetsVerticalTextValue: 10,
                            text: "Enviar",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Expanded(
              //   flex: 3,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: [
              //       Text(
              //         textAlign: TextAlign.center,
              //         "Historial de envíos de notificaciones",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //         ),
              //       ),
              //       Expanded(
              //         child: ListView.builder(
              //           padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
              //           shrinkWrap: true,
              //           itemCount: 5,
              //           itemBuilder: (context, index) {
              //             return Card(
              //               elevation: 2,
              //               color: OrtognaticaColors.veryLightGrey,
              //               child: Row(
              //                 children: [
              //                   Expanded(
              //                     flex: 7,
              //                     child: Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           horizontal: 15,
              //                           vertical: 15,
              //                         ),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.stretch,
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Row(
              //                                   children: [
              //                                     Text(
              //                                       "Doctor: ",
              //                                       style: TextStyle(
              //                                         fontWeight:
              //                                             FontWeight.bold,
              //                                       ),
              //                                     ),
              //                                     Text("MIGUEL ANCHAYHUA")
              //                                   ],
              //                                 ),
              //                                 Row(
              //                                   children: [
              //                                     Text(
              //                                       "Fecha: ",
              //                                       style: TextStyle(
              //                                         fontWeight:
              //                                             FontWeight.bold,
              //                                       ),
              //                                     ),
              //                                     Text("18-17-20")
              //                                   ],
              //                                 )
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               height: 25,
              //                             ),
              //                             Row(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Text(
              //                                   "Título:     ",
              //                                   style: TextStyle(
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                                 Expanded(
              //                                   child: Text(
              //                                       "ASDASD ASD  d as a da asd as das da ads da s dasd"),
              //                                 )
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               height: 10,
              //                             ),
              //                             Row(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Text(
              //                                   "Mensaje: ",
              //                                   style: TextStyle(
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                                 Expanded(
              //                                   child: Text(
              //                                       "ASDASD ASD  das das dasd asd asd as asd asd as dasd as da asd as das da ads da s dasd"),
              //                                 )
              //                               ],
              //                             )
              //                           ],
              //                         )),
              //                   ),
              //                   Expanded(child: Text("sdsd"))
              //                 ],
              //               ),
              //             );
              //           },
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}

class MyWidget extends StatelessWidget {
  final String child;
  const MyWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(height: 300, child: Text("sdsd"));
  }
}
