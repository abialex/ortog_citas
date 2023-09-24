import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/style_utils.dart';
import '../../../data/models/persona/persona_sunat_model.dart';
import '../../global_controllers/consultar_sunat_controller.dart';
import '../../theme/app_colors.dart';
import '../labels/custom_label_form_001.dart';
import '../textFields/text_field_001/custom_text_form_field_001.dart';

class ConsultaSunatPage extends GetView<ConsultaSunatController> {
  final formKey = GlobalKey<FormState>();
  final Function(PersonaSunatModel?) onPressed;
  ConsultaSunatPage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConsultaSunatController>(
      builder: (_) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomLabelForm001(
                    label: 'Buscar Num. Documento:',
                    left: 5,
                    top: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
                  ),
                  TextFormFieldCustom001(
                    icon: Icon(
                      Icons.safety_check,
                      color: Colors.transparent,
                    ),
                    hintText: 'Número de documento',
                    onChanged: _.setSearch,
                    validators: (p0) {},
                    keyboardType: TextInputType.number,
                    inputFormat: InputFormatEnum.numeros,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.left,
                    fontSize: StyleUtils.H3_24,
                    maxlength: 8,
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomLabelForm001(
                      label: '',
                      left: 15,
                      top: StyleUtils.CUSTOM_PADDING_FORM_10_DEFAULT,
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: SlgColors.azul_principal,
                      ),
                      //color: OdebinColors.azul_principal,
                      child: IconButton(
                          alignment: Alignment.center,
                          color: SlgColors.white,
                          onPressed: () async {
                            onPressed(await _.consultarNumeroDocumento());
                          },
                          icon: const Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
