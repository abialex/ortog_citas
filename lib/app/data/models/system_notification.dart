class SystemNotification {
  SystemNotification({
    required this.titulo,
    required this.mensaje,
    required this.detalle,
  });
  String titulo;
  String mensaje;
  String detalle;

  factory SystemNotification.fromJson(Map<String, dynamic> json) =>
      SystemNotification(
        titulo: json["tiutlo"] as String,
        mensaje: json["mensaje"] as String,
        detalle: json["detalle"] as String,
      );

  Map<String, dynamic> toJson() => {
        "tiutlo": titulo,
        "mensaje": mensaje,
        "detalle": detalle,
      };
}
