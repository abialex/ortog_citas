// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contenedor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContenedorModel _$ContenedorModelFromJson(Map<String, dynamic> json) =>
    ContenedorModel(
      id: json['id'] as int,
      nombrecategoria: json['nombrecategoria'] as String,
      abrev: json['abrev'] as String,
    );

Map<String, dynamic> _$ContenedorModelToJson(ContenedorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombrecategoria': instance.nombrecategoria,
      'abrev': instance.abrev,
    };
