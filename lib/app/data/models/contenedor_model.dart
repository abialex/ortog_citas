import 'package:json_annotation/json_annotation.dart';

part 'contenedor_model.g.dart';

@JsonSerializable()
class ContenedorModel {
  final int id;
  final String nombrecategoria;
  final String abrev;
  const ContenedorModel(
      {required this.id, required this.nombrecategoria, required this.abrev});

  //fromJson
  factory ContenedorModel.fromJson(Map<String, dynamic> map) =>
      _$ContenedorModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$ContenedorModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return nombrecategoria;
  }
}
