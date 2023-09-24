import 'package:json_annotation/json_annotation.dart';

part 'rol_model.g.dart';

@JsonSerializable()
class RolModel {
  const RolModel(
    this.id,
    this.idrol,
    this.nombreRol,
    this.prioridad,
  ) : super();

  final int id;
  final int idrol;
  final String nombreRol;
  final int prioridad;

  //fromJson
  factory RolModel.fromJson(Map<String, dynamic> map) =>
      _$RolModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$RolModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombreRol;
  }
}
