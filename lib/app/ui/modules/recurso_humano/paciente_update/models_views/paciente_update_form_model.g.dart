// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_update_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteUpdateFormModel _$PacienteUpdateFormModelFromJson(
        Map<String, dynamic> json) =>
    PacienteUpdateFormModel(
      id: json['id'] as int,
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
      domicilio: json['domicilio'] as String?,
      lugarProcedencia: json['lugarProcedencia'] as String?,
      enfermedadActual: json['enfermedadActual'] as String,
      antecedentes: json['antecedentes'] as String,
    );

Map<String, dynamic> _$PacienteUpdateFormModelToJson(
        PacienteUpdateFormModel instance) =>
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
