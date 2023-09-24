// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApiModel _$ResponseApiModelFromJson(Map<String, dynamic> json) =>
    ResponseApiModel(
      status: json['status'] as int,
      type: json['type'] as String,
      title: json['title'] as String,
      success: json['success'] as bool,
      detail: json['detail'] as String?,
      invalidParams: json['invalidParams'],
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      result: json['result'],
    );

Map<String, dynamic> _$ResponseApiModelToJson(ResponseApiModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'title': instance.title,
      'success': instance.success,
      'detail': instance.detail,
      'invalidParams': instance.invalidParams,
      'messages': instance.messages,
      'result': instance.result,
    };
