import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../theme/app_colors.dart';
import 'controller.dart';
import 'widget/widgets.dart';

class CitaRapidaListPage extends GetWidget<CitaRapidaListController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CitaRapidaListController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: OrtognaticaColors.OrtogColor,
          centerTitle: true,
          title: Text(
            "PACIENTES PARA ACTUALIZAR",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
        ),
        drawer: MenuPrincipal(),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomLabelForm001(
                          label: "Buscar por nombres o razón:",
                          left: 5,
                          top: 5,
                        ),
                        TextFormFieldCustom001(
                          icon: Icon(
                            Icons.question_mark,
                            color: Colors.transparent,
                          ),
                          hintText: "Ingrese un nombre o razón",
                          onChanged: _.setSearch,
                          validators: (p0) {},
                          keyboardType: TextInputType.text,
                          inputFormat: InputFormatEnum.letras,
                          textInputAction: TextInputAction.next,
                          controller: _.buscarCtrl,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomLabelForm001(
                          label: "",
                          left: 5,
                          top: 10,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: OrtognaticaColors.OrtogColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: _.getCitasFilteredModel,
                            icon: Icon(Icons.person_search_sharp),
                            padding: EdgeInsets.zero,
                            color: OrtognaticaColors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: Obx(() {
                  if (controller.loginIconState.value == ProgressState.oculto) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: _.citasFilteredsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCardCita(
                            itemCitaFiltered: _.citasFilteredsList[index],
                            onPressedActualizar: _.gotoPacienteCreateFromCita,
                            onPressedDescartar: _.deleteCitaFiltered);
                      },
                    );
                  } else
                    return Container(
                      child: const Center(
                        child: CustomProgressIndicator(),
                      ),
                    );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
