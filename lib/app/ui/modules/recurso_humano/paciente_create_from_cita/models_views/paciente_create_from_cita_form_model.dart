import 'package:json_annotation/json_annotation.dart';
import '../../../../../data/models/paciente/paciente_create_from_cita_model.dart';
import '../../../../../data/models/paciente/paciente_create_model.dart';

part 'paciente_create_from_cita_form_model.g.dart';

@JsonSerializable()
class PacienteCreateFromCitaFormModel {
  String dni;
  String nombres;
  String apPaterno;
  String apMaterno;
  int idgenero;
  int idtipodoc;
  int idocupacion;
  String fechaNacimiento;
  String motivoConsulta;
  String? celular;
  String? correo;
  String? domicilio;
  String? lugarProcedencia;
  String enfermedadActual;
  String antecedentes;
  //Cita
  int idcita;
  bool isCitaRapida;

  PacienteCreateFromCitaFormModel(
      {required this.dni,
      required this.nombres,
      required this.apPaterno,
      required this.apMaterno,
      required this.idgenero,
      required this.idtipodoc,
      required this.idocupacion,
      required this.fechaNacimiento,
      required this.motivoConsulta,
      this.celular,
      this.correo,
      this.domicilio,
      this.lugarProcedencia,
      required this.enfermedadActual,
      required this.antecedentes,
      required this.idcita,
      required this.isCitaRapida});

  factory PacienteCreateFromCitaFormModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteCreateFromCitaFormModelFromJson(map);

  PacienteCreateFromCitaModel toEntity() {
    return PacienteCreateFromCitaModel(
        dni: dni,
        nombres: nombres,
        apPaterno: apPaterno,
        apMaterno: apMaterno,
        idgenero: idgenero,
        idtipodoc: idtipodoc,
        fechaNacimiento: fechaNacimiento,
        motivoConsulta: motivoConsulta,
        celular: celular,
        correo: correo,
        domicilio: domicilio,
        enfermedadActual: enfermedadActual,
        antecedentes: antecedentes,
        idocupacion: idocupacion,
        lugarProcedencia: lugarProcedencia,
        idcita: idcita,
        isCitaRapida: isCitaRapida);
  }

  factory PacienteCreateFromCitaFormModel.initial() =>
      PacienteCreateFromCitaFormModel(
          dni: "",
          nombres: "",
          apPaterno: "",
          apMaterno: "",
          idgenero: 0,
          idtipodoc: 0,
          idocupacion: 0,
          fechaNacimiento: "",
          motivoConsulta: "",
          celular: null,
          correo: null,
          domicilio: null,
          enfermedadActual: "",
          antecedentes: "",
          lugarProcedencia: null,
          idcita: 0,
          isCitaRapida: false);
}
