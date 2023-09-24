import 'package:ortog_citas/app/domain/entities/persona.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/usuario.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
class UsuarioModel extends Usuario {
  final int id;
  const UsuarioModel(
    this.id, {
    required String username,
    required String persona,
  }) : super(
          username: username,
          persona: persona,
        );

  //fromJson
  factory UsuarioModel.fromJson(Map<String, dynamic> map) =>
      _$UsuarioModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);
}
