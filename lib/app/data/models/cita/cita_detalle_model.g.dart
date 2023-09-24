// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita_detalle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitaDetalleModel _$CitaDetalleModelFromJson(Map<String, dynamic> json) =>
    CitaDetalleModel(
      id: json['id'] as int,
      fechaCita: json['fechaCita'] as String,
      hora: json['hora'] as String,
      paciente: json['paciente'] as String,
      edad: json['edad'] as int,
      motivoConsulta: json['motivoConsulta'] as String,
      enfermedadActual: json['enfermedadActual'] as String,
      antecedentes: json['antecedentes'] as String,
      razon: json['razon'] as String,
      isAsistActualizado: json['isAsistActualizado'] as bool,
      isAsist: json['isAsist'] as bool,
      isAsistString: json['isAsistString'] as String,
    );

Map<String, dynamic> _$CitaDetalleModelToJson(CitaDetalleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fechaCita': instance.fechaCita,
      'hora': instance.hora,
      'paciente': instance.paciente,
      'edad': instance.edad,
      'motivoConsulta': instance.motivoConsulta,
      'enfermedadActual': instance.enfermedadActual,
      'antecedentes': instance.antecedentes,
      'razon': instance.razon,
      'isAsistActualizado': instance.isAsistActualizado,
      'isAsist': instance.isAsist,
      'isAsistString': instance.isAsistString,
    };
