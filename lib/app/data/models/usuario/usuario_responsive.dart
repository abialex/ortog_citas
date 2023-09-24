import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/usuario.dart';
import '../container/rol_model.dart';
import '../container/sede_model.dart';

part 'usuario_responsive.g.dart';

@JsonSerializable()
class UsuarioResponsive extends Usuario {
  final int id;
  final String sessionKey;
  final List<SedeModel> sedes;
  final List<RolModel> roles;
  const UsuarioResponsive({
    required this.id,
    required this.sessionKey,
    required this.sedes,
    required this.roles,
    required String username,
    String? persona,
  }) : super(
          username: username,
          persona: persona,
        );

  //fromJson
  factory UsuarioResponsive.fromJson(Map<String, dynamic> map) =>
      _$UsuarioResponsiveFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$UsuarioResponsiveToJson(this);
}
