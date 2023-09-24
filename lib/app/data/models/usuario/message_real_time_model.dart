import 'package:json_annotation/json_annotation.dart';

part 'message_real_time_model.g.dart';

@JsonSerializable()
class MessageRealTimeModel {
  final String? titulo;
  final String? mensaje;
  final String? cuerpo;
  const MessageRealTimeModel(
      {required this.titulo, required this.mensaje, required this.cuerpo});

  //fromJson
  factory MessageRealTimeModel.fromJson(Map<String, dynamic> map) =>
      _$MessageRealTimeModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$MessageRealTimeModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
