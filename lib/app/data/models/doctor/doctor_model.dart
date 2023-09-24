import 'package:ortog_citas/app/domain/entities/doctor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel extends Doctor {
  const DoctorModel({
    required int id,
    required String usuario,
    required String dni,
    required String denominacion,
    required String? correo,
    required String? celular,
    required String fechaNacimiento,
  }) : super(
          id: id,
          usuario: usuario,
          dni: dni,
          denominacion: denominacion,
          correo: correo,
          celular: celular,
          fechaNacimiento: fechaNacimiento,
        );

  //fromJson
  factory DoctorModel.fromJson(Map<String, dynamic> map) =>
      _$DoctorModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return denominacion;
  }
}
