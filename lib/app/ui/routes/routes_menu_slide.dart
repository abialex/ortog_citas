import 'package:flutter/material.dart';

import 'app_routes.dart';

//----------------------------------------------------------------
//los modulos que ve el DEV
final RutasDev = <RutasMenu>[
  RutasMenu(Icons.home, 'Inicio', AppRoutes.HOME_ADMINISTRADOR),
  RutasMenu(
      Icons.person_pin_circle_outlined, 'Pacientes', AppRoutes.PACIENTE_LIST),
  RutasMenu(Icons.update, 'Actualizar Citas', AppRoutes.CITA_RAPIDA_LIST),
  RutasMenu(Icons.notification_important_rounded, 'Notificaciones',
      AppRoutes.NOTIFICACIONES),
  RutasMenu(Icons.password_rounded, 'Credenciales', AppRoutes.CREDENCIALES),
];

//----------------------------------------------------------------
//los modulos que ve el ADMINISTRADOR
final RutasAdmin = <RutasMenu>[
  RutasMenu(Icons.home, 'Inicio', AppRoutes.HOME_ADMINISTRADOR),
  RutasMenu(Icons.checklist_rtl, 'Citas', AppRoutes.CITA),
  RutasMenu(
      Icons.person_pin_circle_outlined, 'Pacientes', AppRoutes.PACIENTE_LIST),
];

//----------------------------------------------------------------
// los modulos que ve la ASISTENTA
final RutasAsistente = <RutasMenu>[
  RutasMenu(Icons.home, 'Inicio', AppRoutes.HOME_ASISTENTA),
  RutasMenu(Icons.checklist, 'Citas', AppRoutes.CITA),
  RutasMenu(
      Icons.personal_injury_outlined, 'Pacientes', AppRoutes.PACIENTE_LIST),
  RutasMenu(Icons.update, 'Actualizar Citas', AppRoutes.CITA_RAPIDA_LIST),
];

//----------------------------------------------------------------
// los modulos que ve el DOCTOR
final RutasDoctor = <RutasMenu>[
  RutasMenu(Icons.home, 'Inicio', AppRoutes.HOME_DOCTOR),
  RutasMenu(Icons.checklist_rtl, 'Citas', AppRoutes.CITA_LIST_DOCTOR),
];

class RutasMenu {
  final IconData icon;
  final String titulo;
  final String routePage;

  RutasMenu(this.icon, this.titulo, this.routePage);
}
