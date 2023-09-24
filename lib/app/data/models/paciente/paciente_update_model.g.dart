// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteUpdateModel _$PacienteUpdateModelFromJson(Map<String, dynamic> json) =>
    PacienteUpdateModel(
      id: json['id'] as int,
      dni: json['dni'] as String,
      nombres: json['nombres'] as String,
      apPaterno: json['apPaterno'] as String,
      apMaterno: json['apMaterno'] as String,
      idgenero: json['idgenero'] as int,
      idtipodoc: json['idtipodoc'] as int,
      fechaNacimiento: json['fechaNacimiento'] as String,
      motivoConsulta: json['motivoConsulta'] as String,
      celular: json['celular'] as String?,
      correo: json['correo'] as String?,
      domicilio: json['domicilio'] as String?,
      lugarProcedencia: json['lugarProcedencia'] as String?,
      enfermedadActual: json['enfermedadActual'] as String,
      antecedentes: json['antecedentes'] as String,
      idocupacion: json['idocupacion'] as int,
    );

Map<String, dynamic> _$PacienteUpdateModelToJson(
        PacienteUpdateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apPaterno': instance.apPaterno,
      'apMaterno': instance.apMaterno,
      'idgenero': instance.idgenero,
      'idtipodoc': instance.idtipodoc,
      'idocupacion': instance.idocupacion,
      'fechaNacimiento': instance.fechaNacimiento,
      'motivoConsulta': instance.motivoConsulta,
      'celular': instance.celular,
      'correo': instance.correo,
      'domicilio': instance.domicilio,
      'lugarProcedencia': instance.lugarProcedencia,
      'enfermedadActual': instance.enfermedadActual,
      'antecedentes': instance.antecedentes,
    };
