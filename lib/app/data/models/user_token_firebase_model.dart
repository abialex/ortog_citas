import 'package:json_annotation/json_annotation.dart';

part 'user_token_firebase_model.g.dart';

@JsonSerializable()
class UserTokenFirebaseModel {
  final int idusuario;
  final String username;
  final String token;
  const UserTokenFirebaseModel(
      {required this.idusuario, required this.username, required this.token});

  //fromJson
  factory UserTokenFirebaseModel.fromJson(Map<String, dynamic> map) =>
      _$UserTokenFirebaseModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$UserTokenFirebaseModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return username;
  }
}
