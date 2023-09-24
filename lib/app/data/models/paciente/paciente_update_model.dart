import 'package:ortog_citas/app/domain/entities/doctor.dart';
import 'package:ortog_citas/app/domain/entities/paciente.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paciente_update_model.g.dart';

@JsonSerializable()
class PacienteUpdateModel {
  final int id;
  final String dni;
  final String nombres;
  final String apPaterno;
  final String apMaterno;
  final int idgenero;
  final int idtipodoc;
  final int idocupacion;
  final String fechaNacimiento;
  final String motivoConsulta;
  final String? celular;
  final String? correo;
  final String? domicilio;
  final String? lugarProcedencia;
  final String enfermedadActual;
  final String antecedentes;

  const PacienteUpdateModel(
      {required this.id,
      required this.dni,
      required this.nombres,
      required this.apPaterno,
      required this.apMaterno,
      required this.idgenero,
      required this.idtipodoc,
      required this.fechaNacimiento,
      required this.motivoConsulta,
      this.celular,
      this.correo,
      this.domicilio,
      this.lugarProcedencia,
      required this.enfermedadActual,
      required this.antecedentes,
      required this.idocupacion});

  //fromJson
  factory PacienteUpdateModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PacienteUpdateModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombres;
  }
}
