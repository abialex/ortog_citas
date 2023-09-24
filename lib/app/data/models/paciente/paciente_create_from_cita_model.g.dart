// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_create_from_cita_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteCreateFromCitaModel _$PacienteCreateFromCitaModelFromJson(
        Map<String, dynamic> json) =>
    PacienteCreateFromCitaModel(
      dni: json['dni'] as String,
      nombres: json['nombres'] as String,
      apPaterno: json['apPaterno'] as String,
      apMaterno: json['apMaterno'] as String,
      idgenero: json['idgenero'] as int,
      idtipodoc: json['idtipodoc'] as int,
      idocupacion: json['idocupacion'] as int,
      fechaNacimiento: json['fechaNacimiento'] as String,
      motivoConsulta: json['motivoConsulta'] as String,
      celular: json['celular'] as String?,
      correo: json['correo'] as String?,
      lugarProcedencia: json['lugarProcedencia'] as String?,
      domicilio: json['domicilio'] as String?,
      enfermedadActual: json['enfermedadActual'] as String,
      antecedentes: json['antecedentes'] as String,
      idcita: json['idcita'] as int,
      isCitaRapida: json['isCitaRapida'] as bool,
    );

Map<String, dynamic> _$PacienteCreateFromCitaModelToJson(
        PacienteCreateFromCitaModel instance) =>
    <String, dynamic>{
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
      'idcita': instance.idcita,
      'isCitaRapida': instance.isCitaRapida,
    };
