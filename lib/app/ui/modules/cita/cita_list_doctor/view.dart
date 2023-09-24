import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/date_pickers/custom_date_picker_002.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../global_widgets/toggle/toogle_producto_service.dart';
import '../../../theme/app_colors.dart';
import 'controller.dart';
import 'widget/widgets.dart';

class CitaListDoctorPage extends GetWidget<CitaListDoctorController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CitaListDoctorController>(builder: (_) {
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
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomLabelForm001(
                          label: "Doctor:",
                          left: 10,
                          top: 10,
                        ),
                        CustomLabelForm001(
                            textAlign: TextAlign.center,
                            label: _.user.value.persona ?? "NN",
                            left: 0,
                            top: 5),
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
                          label: 'Fecha y nombre del día:',
                          left: 10,
                          top: 10,
                        ),
                        CustomDatePicker002(
                          dateInit: _.dateInit.value,
                          onChangeDate: _.setFecha,
                          maximunYear: 2025,
                          minimunYear: 2021,
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Obx(
                          () => CustomLabelForm001(
                            textSize: 20,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            label: _.nombreDiaRx.value,
                            left: 5,
                            top: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Obx(
                      () => Visibility(
                        visible: !_.isVerificadoToday.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              decoration: BoxDecoration(
                                color: SlgColors.azul_principal,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.update),
                                onPressed: _.getListHoraModelFilterToday,
                                color: SlgColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: SlgColors.azul_principal,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Obx(
                              () => Icon(_.isVerificado.value
                                  ? Icons.search
                                  : Icons.saved_search_rounded),
                            ),
                            onPressed: _.getListHoraModelFilter,
                            color: SlgColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomToggleList(
                  heightBox: 25,
                  isMultiSelect: true,
                  listBool: _.listbool,
                  listWords: _.listTime,
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.loginIconState.value == ProgressState.oculto) {
                    return Visibility(
                      visible: _.isVerificado.value,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: _.citasList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() {
                            late Widget card;
                            if (_.citasList[index].isLibre) {
                              card = CustomCardCitaLibre(
                                  itemHoraModel: _.citasList[index]);
                            } else {
                              if (_.citasList[index].isOcupado) {
                                card = CustomCardCitaOcupado(
                                  itemHoraModel: _.citasList[index],
                                );
                              } else {
                                card = CustomCardCita(
                                  onNavigate1: _.gotoPacienteDetalle,
                                  onNavigate2: _.gotoCitaDetalle,
                                  itemHoraModel: _.citasList[index],
                                );
                              }
                            }
                            if (-1 == _.listbool.indexOf(true.obs)) {
                              return card;
                            } else {
                              final isVisible = _.listbool[index].value;
                              return (isVisible ? card : SizedBox.shrink());
                            }
                          });
                        },
                      ),
                    );
                  } else {
                    return Container(
                      child: const Center(
                        child: CustomProgressIndicator(),
                      ),
                    );
                  }
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
                        child: Text(_.user.value.username,
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
      );
    });
  }
}
