import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Paciente {
  const Paciente({
    required this.id,
    required this.dni,
    required this.nombres,
    required this.apPaterno,
    required this.apMaterno,
  });
  final int id;
  final String dni;
  final String nombres;
  final String apPaterno;
  final String apMaterno;
}
