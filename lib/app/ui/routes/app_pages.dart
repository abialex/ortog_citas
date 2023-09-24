import 'package:get/get.dart';

// import '../modules/configuracion/index.dart';
// import '../modules/dashboard/dashboard_binding.dart';
// import '../modules/dashboard/dashboard_page.dart';
// import '../modules/empresa/empresa_list/index.dart';
// import '../modules/home/index.dart';
// import '../modules/login/index.dart';
// import '../modules/persona/persona_create/index.dart';
// import '../modules/persona/persona_list/index.dart';
// import '../modules/persona/persona_update/index.dart';
// import '../modules/producto/index.dart';
// import '../modules/splash/index.dart';
// import '../modules/venta/venta_create/index.dart';
// import '../modules/venta/venta_list/index.dart';
import '../modules/cita/cita_create/index.dart';
import '../modules/cita/cita_detalle/index.dart';
import '../modules/cita/cita_list/index.dart';
import '../modules/cita/cita_list_doctor/binding.dart';
import '../modules/cita/cita_list_doctor/view.dart';
import '../modules/cita/cita_rapida_list/index.dart';
import '../modules/configuracion/credenciales/index.dart';
import '../modules/configuracion/notificaciones/index.dart';
import '../modules/inicio/inicio_administrador/index.dart';
import '../modules/inicio/inicio_asistenta/index.dart';
import '../modules/inicio/inicio_doctor/binding.dart';
import '../modules/inicio/inicio_doctor/view.dart';
import '../modules/login/index.dart';
import '../modules/recurso_humano/paciente_create/index.dart';
import '../modules/recurso_humano/paciente_create_from_cita/index.dart';
import '../modules/recurso_humano/paciente_detalle/binding.dart';
import '../modules/recurso_humano/paciente_detalle/view.dart';
import '../modules/recurso_humano/paciente_list/binding.dart';
import '../modules/recurso_humano/paciente_list/view.dart';
import '../modules/recurso_humano/paciente_update/binding.dart';
import '../modules/recurso_humano/paciente_update/view.dart';
import '../modules/splash/index.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();
  static final List<GetPage> pages = [
    GetPage(
        transition: Transition.cupertino,
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        transition: Transition.zoom,
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: AppRoutes.CITA,
      page: () => Cita(),
      binding: CitaBinding(),
    ),
    GetPage(
      name: AppRoutes.CITA_CREATE,
      page: () => CitaCreate(),
      binding: CitaCreateBinding(),
    ),
    GetPage(
      name: AppRoutes.PACIENTE_CREATE,
      page: () => PacienteCreatePage(),
      binding: PacienteCreateBinding(),
    ),
    GetPage(
      name: AppRoutes.PACIENTE_UPDATE,
      page: () => PacienteUpdatePage(),
      binding: PacienteUpdateBinding(),
    ),
    GetPage(
      name: AppRoutes.PACIENTE_LIST,
      page: () => PacienteListPage(),
      binding: PacienteListBinding(),
    ),
    GetPage(
      name: AppRoutes.CITA_LIST_DOCTOR,
      page: () => CitaListDoctorPage(),
      binding: CitaListDotorBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME_ADMINISTRADOR,
      page: () => InicioAdministradorPage(),
      binding: InicioAdministradorBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME_ASISTENTA,
      page: () => InicioAsistentaPage(),
      binding: InicioAsistentaBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME_DOCTOR,
      page: () => InicioDoctorPage(),
      binding: InicioDoctorBinding(),
    ),
    GetPage(
      name: AppRoutes.PACIENTE_DETALLE,
      page: () => PacienteDetallePage(),
      binding: PacienteDetalleBinding(),
    ),
    GetPage(
      name: AppRoutes.CITA_DETALLE,
      page: () => CitaDetallePage(),
      binding: CitaDetalleBinding(),
    ),
    GetPage(
      name: AppRoutes.CITA_RAPIDA_LIST,
      page: () => CitaRapidaListPage(),
      binding: CitaRapidaListBinding(),
    ),
    GetPage(
      name: AppRoutes.PACIENTE_CREATE_FROM_CITA,
      page: () => PacienteCreateFromCitaPage(),
      binding: PacienteCreateFromCitaBinding(),
    ),
    GetPage(
      name: AppRoutes.CREDENCIALES,
      page: () => CredencialesPage(),
      binding: CredencialesBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICACIONES,
      page: () => NotificacionesPage(),
      binding: NotificacionesBinding(),
    ),
  ];
}
