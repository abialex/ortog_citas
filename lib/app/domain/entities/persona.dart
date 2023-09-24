import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Persona {
  const Persona({
    this.idpersona,
    required this.dni,
    required this.nombres,
    required this.ap_paterno,
    required this.ap_materno,
    required this.celular,
    required this.sexo,
    required this.ocupacion,
    required this.lugar_de_procedencia,
    required this.domicilio,
  });
  final int? idpersona;
  final String dni;
  final String nombres;
  final String ap_paterno;
  final String ap_materno;
  final String celular;
  final String sexo;
  final String ocupacion;
  final String lugar_de_procedencia;
  final String domicilio;
}
