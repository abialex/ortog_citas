// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: json['id'] as int,
      usuario: json['usuario'] as String,
      dni: json['dni'] as String,
      denominacion: json['denominacion'] as String,
      correo: json['correo'] as String?,
      celular: json['celular'] as String?,
      fechaNacimiento: json['fechaNacimiento'] as String,
      usuario_id: json['usuario_id'] as int,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuario': instance.usuario,
      'dni': instance.dni,
      'denominacion': instance.denominacion,
      'correo': instance.correo,
      'celular': instance.celular,
      'fechaNacimiento': instance.fechaNacimiento,
      'usuario_id': instance.usuario_id,
    };
