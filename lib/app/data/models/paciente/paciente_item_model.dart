import 'package:ortog_citas/app/domain/entities/doctor.dart';
import 'package:ortog_citas/app/domain/entities/paciente.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paciente_item_model.g.dart';

@JsonSerializable()
class PacienteItemModel {
  final int id;
  final String dni;
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
  final int idtipodoc;
  final int idocupacion;
  final String motivoConsulta;
  final String enfermedadActual;
  final String antecedentes;
  final bool is_active;
  final String is_activeText;

  const PacienteItemModel(
      {required this.id,
      required this.dni,
      required this.denominacion,
      required this.idgenero,
      required this.idtipodoc,
      required this.fechaNacimiento,
      required this.edad,
      required this.motivoConsulta,
      this.celular,
      this.correo,
      this.domicilio,
      required this.enfermedadActual,
      required this.antecedentes,
      this.lugarProcedencia,
      required this.ocupacion,
      required this.genero,
      required this.tipodoc,
      required this.tipodocAbrev,
      required this.idocupacion,
      required this.is_active,
      required this.is_activeText});

  //fromJson
  factory PacienteItemModel.fromJson(Map<String, dynamic> map) =>
      _$PacienteItemModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PacienteItemModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return denominacion;
  }
}
