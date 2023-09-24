abstract class Usuario {
  const Usuario({
    required this.username,
    this.persona,
  });

  final String username;
  final String? persona;
}
