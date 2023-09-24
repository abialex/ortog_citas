import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/style_utils.dart';
import '../../../global_widgets/date_pickers/custom_date_picker_001.dart';
import '../../../global_widgets/divider/custom_divider.dart';
import '../../../global_widgets/drawer_menu/navigation_drawer.dart';
import '../../../global_widgets/dropdowns/dropdown01/custom_dropdown_form_field_001.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/progressIndicatorCustom/custom_progress.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';
import 'widgets/custom_paciente_item_card.dart';

class PacienteListPage extends GetWidget<PacienteListController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PacienteListController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: SlgColors.azul_principal,
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
          backgroundColor: SlgColors.azul_principal,
          tooltip: "agregar paciente",
          onPressed: () {},
          child: IconButton(
            constraints: BoxConstraints(),
            icon: Icon(Icons.add),
            padding: EdgeInsets.zero,
            onPressed: _.gotoPacienteCreate,
            color: SlgColors.white,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomLabelForm001(
                            label: "",
                            left: 5,
                            top: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: SlgColors.azul_principal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              constraints: BoxConstraints(),
                              onPressed: _.consultarPaciente,
                              icon: Icon(Icons.search),
                              color: SlgColors.white,
                            ),
                          ),
                        ],
                      ),
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
