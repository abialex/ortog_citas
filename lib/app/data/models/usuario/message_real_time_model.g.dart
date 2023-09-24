// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_real_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRealTimeModel _$MessageRealTimeModelFromJson(
        Map<String, dynamic> json) =>
    MessageRealTimeModel(
      titulo: json['titulo'] as String?,
      mensaje: json['mensaje'] as String?,
      cuerpo: json['cuerpo'] as String?,
    );

Map<String, dynamic> _$MessageRealTimeModelToJson(
        MessageRealTimeModel instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'mensaje': instance.mensaje,
      'cuerpo': instance.cuerpo,
    };
