import 'package:ortog_citas/app/core/utils/style_utils.dart';
import 'package:ortog_citas/app/data/models/container/sede_model.dart';
import 'package:ortog_citas/app/data/models/contenedor_model.dart';
import 'package:ortog_citas/app/ui/global_widgets/buttons/custom_button_submit.dart';
import 'package:ortog_citas/app/ui/global_widgets/drawer_menu/navigation_drawer.dart';
import 'package:ortog_citas/app/ui/modules/recurso_humano/paciente_list/widgets/custom_paciente_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/date_pickers/custom_date_picker_001.dart';
import '../../../global_widgets/divider/custom_divider.dart';
import '../../../global_widgets/dropdowns/dropdown01/custom_dropdown_form_field_001.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';

class PacienteListPage extends GetWidget<PacienteListController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PacienteListController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: OrtogColors.ortog_color,
          centerTitle: true,
          title: Text(
            "LISTA DE PACIENTES",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: StyleUtils.P0_15),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: OrtogColors.ortog_color,
          tooltip: "agregar paciente",
          onPressed: () {},
          child: IconButton(
            constraints: BoxConstraints(),
            icon: Icon(Icons.add),
            padding: EdgeInsets.zero,
            onPressed: _.gotoPacienteCreate,
            color: OrtogColors.white,
            iconSize: 35,
          ),
        ),
        drawer: MenuPrincipal(),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomLabelForm001(
                          label: "Nombres o documento:",
                          left: 5,
                          top: 5,
                        ),
                        TextFormFieldCustom001(
                          icon: Icon(Icons.people),
                          hintText: "Ingrese un nombre, apellidos o documento",
                          onChanged: _.setSearch,
                          validators: (p0) {},
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
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
                          top: 5,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: OrtogColors.ortog_color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: _.consultarPaciente,
                            icon: Icon(Icons.search),
                            padding: EdgeInsets.zero,
                            color: OrtogColors.white,
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
                      itemCount: _.pacientesList.length,
                      itemBuilder: (context, index) {
                        return CustomCardPersonaItemWidget(
                          onDetalle: _.gotoPacienteDetalle,
                          onUpdate: _.gotoPacienteUpdate,
                          pacienteItem: _.pacientesList[index],
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: const Center(
                        child: CustomProgressIndicator(),
                      ),
                    );
                  }
                }),
              )
            ],
          ),
        ),
      );
    });
  }
}
