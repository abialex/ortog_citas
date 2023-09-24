import 'package:ortog_citas/app/domain/entities/doctor.dart';
import 'package:ortog_citas/app/domain/entities/paciente.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paciente_model.g.dart';

@JsonSerializable()
class PacienteModel extends Paciente {
  const PacienteModel(
      {required int id,
      required String dni,
      required String nombres,
      required String apPaterno,
      required String apMaterno,
      required this.denominacion,
      this.correo,
      this.celular,
      required this.fechaNacimiento,
      required this.edad,
      this.lugarProcedencia,
      this.domicilio,
      required this.ocupacion,
      required this.genero,
      required this.tipodoc,
      required this.tipodocAbrev,
      required this.idgenero,
      required this.idocupacion,
      required this.antecedentes,
      required this.idtipodoc,
      required this.is_active,
      required this.enfermedadActual,
      required this.is_activeText,
      required this.motivoConsulta})
      : super(
          id: id,
          dni: dni,
          nombres: nombres,
          apPaterno: apPaterno,
          apMaterno: apMaterno,
        );
  final String denominacion;
  final String? correo;
  final String? celular;
  final String fechaNacimiento;
  final int edad;
  final String? lugarProcedencia;
  final String? domicilio;
  final String ocupacion;
  final String genero;
  final String tipodoc;
  final String tipodocAbrev;
  final int idgenero;
  final int idocupacion;
  final int idtipodoc;
  final String motivoConsulta;
  final String antecedentes;
  final String enfermedadActual;
  final bool is_active;
  final String is_activeText;
  //fromJson
  factory PacienteModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PacienteModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombres;
  }
}
