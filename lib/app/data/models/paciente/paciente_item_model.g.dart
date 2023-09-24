// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteItemModel _$PacienteItemModelFromJson(Map<String, dynamic> json) =>
    PacienteItemModel(
      id: json['id'] as int,
      dni: json['dni'] as String,
      denominacion: json['denominacion'] as String,
      idgenero: json['idgenero'] as int,
      idtipodoc: json['idtipodoc'] as int,
      fechaNacimiento: json['fechaNacimiento'] as String,
      edad: json['edad'] as int,
      motivoConsulta: json['motivoConsulta'] as String,
      celular: json['celular'] as String?,
      correo: json['correo'] as String?,
      domicilio: json['domicilio'] as String?,
      enfermedadActual: json['enfermedadActual'] as String,
      antecedentes: json['antecedentes'] as String,
      lugarProcedencia: json['lugarProcedencia'] as String?,
      ocupacion: json['ocupacion'] as String,
      genero: json['genero'] as String,
      tipodoc: json['tipodoc'] as String,
      tipodocAbrev: json['tipodocAbrev'] as String,
      idocupacion: json['idocupacion'] as int,
      is_active: json['is_active'] as bool,
      is_activeText: json['is_activeText'] as String,
    );

Map<String, dynamic> _$PacienteItemModelToJson(PacienteItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
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
      'idtipodoc': instance.idtipodoc,
      'idocupacion': instance.idocupacion,
      'motivoConsulta': instance.motivoConsulta,
      'enfermedadActual': instance.enfermedadActual,
      'antecedentes': instance.antecedentes,
      'is_active': instance.is_active,
      'is_activeText': instance.is_activeText,
    };
