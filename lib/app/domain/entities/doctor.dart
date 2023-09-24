import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Doctor {
  const Doctor({
    required this.id,
    required this.usuario,
    required this.dni,
    required this.denominacion,
    this.correo,
    this.celular,
    required this.fechaNacimiento,
  });
  final int id;
  final String usuario;
  final String dni;
  final String denominacion;
  final String? correo;
  final String? celular;
  final String fechaNacimiento;
}
