// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteModel _$PacienteModelFromJson(Map<String, dynamic> json) =>
    PacienteModel(
      id: json['id'] as int,
      dni: json['dni'] as String,
      nombres: json['nombres'] as String,
      apPaterno: json['apPaterno'] as String,
      apMaterno: json['apMaterno'] as String,
      denominacion: json['denominacion'] as String,
      correo: json['correo'] as String?,
      celular: json['celular'] as String?,
      fechaNacimiento: json['fechaNacimiento'] as String,
      edad: json['edad'] as int,
      lugarProcedencia: json['lugarProcedencia'] as String?,
      domicilio: json['domicilio'] as String?,
      ocupacion: json['ocupacion'] as String,
      genero: json['genero'] as String,
      tipodoc: json['tipodoc'] as String,
      tipodocAbrev: json['tipodocAbrev'] as String,
      idgenero: json['idgenero'] as int,
      idocupacion: json['idocupacion'] as int,
      antecedentes: json['antecedentes'] as String,
      idtipodoc: json['idtipodoc'] as int,
      is_active: json['is_active'] as bool,
      enfermedadActual: json['enfermedadActual'] as String,
      is_activeText: json['is_activeText'] as String,
      motivoConsulta: json['motivoConsulta'] as String,
    );

Map<String, dynamic> _$PacienteModelToJson(PacienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apPaterno': instance.apPaterno,
      'apMaterno': instance.apMaterno,
      'denominacion': instance.denominacion,
      'correo': instance.correo,
      'celular': instance.celular,
      'fechaNacimiento': instance.fechaNacimiento,
      'edad': instance.edad,
      'lugarProcedencia': instance.lugarProcedencia,
      'domicilio': instance.domicilio,
      'ocupacion': instance.ocupacion,
      'genero': instance.genero,
      'tipodoc': instance.tipodoc,
      'tipodocAbrev': instance.tipodocAbrev,
      'idgenero': instance.idgenero,
      'idocupacion': instance.idocupacion,
      'idtipodoc': instance.idtipodoc,
      'motivoConsulta': instance.motivoConsulta,
      'antecedentes': instance.antecedentes,
      'enfermedadActual': instance.enfermedadActual,
      'is_active': instance.is_active,
      'is_activeText': instance.is_activeText,
    };
