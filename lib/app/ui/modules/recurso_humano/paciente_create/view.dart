import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/contenedor_model.dart';
import '../../../global_widgets/buttons/custom_button_submit.dart';
import '../../../global_widgets/date_pickers/custom_date_picker_001.dart';
import '../../../global_widgets/divider/custom_divider.dart';
import '../../../global_widgets/dropdowns/dropdown01/custom_dropdown_form_field_001.dart';
import '../../../global_widgets/labels/custom_label_form_001.dart';
import '../../../global_widgets/lookfor/consultar_sunat_widget.dart';
import '../../../global_widgets/textFields/text_field_001/custom_text_form_field_001.dart';
import '../../../theme/app_colors.dart';
import 'index.dart';

class PacienteCreatePage extends GetWidget<PacienteCreateController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PacienteCreateController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: OrtognaticaColors.OrtogColor,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: Text(
                  "CREAR PACIENTE",
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
        body: SafeArea(
          top: false,
          child: Container(
            constraints: const BoxConstraints.expand(),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomDivider(
                      paddindTop: 15,
                      title: 'Datos del Paciente',
                    ),
                    ConsultaSunatPage(
                      onPressed: _.getPersonaSunat, //QUE HAGO CON LOQUE RECIBO,
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
                                icon: Icon(Icons.people),
                                hintText: "Ingrese un nombre",
                                onChanged: _.setNombres,
                                validators: _.nombresValidators,
                                keyboardType: TextInputType.text,
                                inputFormat: InputFormatEnum.letras,
                                textInputAction: TextInputAction.next,
                                controller: _.nombresCtrl,
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
                                icon: Icon(
                                  Icons.question_mark,
                                  color: Colors.transparent,
                                ),
                                hintText: "Ingrese una apellido paterno",
                                onChanged: _.setApellidoPaterno,
                                validators: _.apellidoPaternoValidators,
                                keyboardType: TextInputType.text,
                                inputFormat: InputFormatEnum.letras,
                                textInputAction: TextInputAction.next,
                                controller: _.apellidoPaternoCtrl,
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
                                icon: Icon(
                                  Icons.question_mark,
                                  color: Colors.transparent,
                                ),
                                hintText: "Ingrese una apellido materno",
                                onChanged: _.setApellidoMaterno,
                                validators: _.apellidoMaternoValidators,
                                keyboardType: TextInputType.text,
                                inputFormat: InputFormatEnum.letras,
                                textInputAction: TextInputAction.next,
                                controller: _.apellidoMaternoCtrl,
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
                              CustomDropdownButtonFormField<ContenedorModel>(
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
                              CustomDropdownButtonFormField<ContenedorModel>(
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
                              CustomDatePicker001(
                                firstDate: _.initialDate.value,
                                initialDate: _.selectedDateFechaNacimiento,
                                hintText:
                                    'click para seleccionar la fecha de nacimiento',
                                lastDate: DateTime.now(),
                                onChanged: _.setFechaNacimiento,
                                controller: _.dateFechaNacimiento,
                                validator: _.fechaNacimientoValidators,
                              ),
                              // CustomDatePicker002(
                              //   dateInit: _. selectDate.value,
                              //   onChangeDate: _.setFechaNacimiento,
                              //   maximunYear: DateTime.now().year,
                              //   minimunYear: 1900,
                              //   mode: CupertinoDatePickerMode.date,
                              // ),
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
                              const CustomLabelForm001(
                                label: "Tipo documento:",
                                left: 5,
                                top: 15,
                              ),
                              CustomDropdownButtonFormField<ContenedorModel>(
                                items: _.contenedorTipoDocumento,
                                hintText: "seleccionar",
                                onChanged: _.setTipoDocumento,
                                validators: _.tipoDocumentoValidators,
                                height: 20,
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
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.transparent,
                                ),
                                hintText: "Número doc.",
                                onChanged: _.setNumDocumento,
                                validators: _.numDocValidators,
                                keyboardType: TextInputType.number,
                                inputFormat: InputFormatEnum.numeros,
                                maxlength: 8,
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
                                label: "Celular",
                                left: 5,
                                top: 5,
                              ),
                              TextFormFieldCustom001(
                                icon: Icon(Icons.phone),
                                hintText: "celular",
                                onChanged: _.setCelular,
                                validators: (p0) {},
                                keyboardType: TextInputType.number,
                                inputFormat: InputFormatEnum.numeros,
                                maxlength: 9,
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
                                icon: Icon(Icons.map),
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
                            color: OrtognaticaColors.greyWhite,
                            paggingInsetsButtonValue: 5,
                            onTap: _.gotoBack,
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
          ),
        ),
      );
    });
  }
}
