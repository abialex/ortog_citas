import 'package:ortog_citas/app/data/provider/api/remote/cita_api.dart';
import 'package:ortog_citas/app/data/provider/api/remote/paciente_api.dart';
import 'package:ortog_citas/app/data/provider/api/remote/persona_api.dart';
import 'package:ortog_citas/app/data/repository_imp/remote/doctor_repository.dart';
import 'package:ortog_citas/app/data/repository_imp/remote/handle_firebase_repository.dart';
import 'package:ortog_citas/app/data/repository_imp/remote/paciente_repository.dart';
import 'package:ortog_citas/app/domain/repository/ipaciente_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../data/provider/api/local/local_auth.dart';
import '../../data/provider/api/remote/authentication_api.dart';
import '../../data/provider/api/remote/doctor_api.dart';
import '../../data/provider/api/remote/contenedor_api.dart';
import '../../data/provider/api/remote/handle_firebase_api.dart';
import '../../data/repository_imp/local/local_auth_repository.dart';
import '../../data/repository_imp/remote/authentication_repository.dart';
import '../../data/repository_imp/remote/cita_repository.dart';
import '../../data/repository_imp/remote/connectivity_repository.dart';
import '../../data/repository_imp/remote/contenedor_repository.dart';
import '../../data/repository_imp/remote/persona_repository.dart';
import '../../domain/repository/iauthentication_repository.dart';
import '../../domain/repository/icita_repository.dart';
import '../../domain/repository/iconnectivity_repository.dart';
import '../../domain/repository/idoctor_repository.dart';
import '../../domain/repository/ihandle_firebase_repository.dart';
import '../../domain/repository/icontenedor_repository.dart';
import '../../domain/repository/ipersona_repository.dart';
import '../../ui/global_controllers/consultar_sunat_controller.dart';
import '../../ui/global_controllers/theme_controller.dart';

class DependencyInjection {
  static Future<void> init() async {
    Get.put<FlutterSecureStorage>(const FlutterSecureStorage());
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'http://alex-ya.me:2500',
          //baseUrl: 'http://192.168.100.36:5500',
        ),
      ),
      fenix: true,
    );

    ///providers-------------------------------------------------------------------------------
    Get.lazyPut<AuthenticationAPI>(
      () => AuthenticationAPI(),
      fenix: true,
    );
    // Get.lazyPut<ProductoAPI>(
    //   () => ProductoAPI(),
    //   fenix: true,
    // );

    Get.lazyPut<ContenedorAPI>(
      () => ContenedorAPI(),
      fenix: true,
    );

    Get.lazyPut<DoctorAPI>(
      () => DoctorAPI(),
      fenix: true,
    );
    Get.lazyPut<CitaAPI>(
      () => CitaAPI(),
      fenix: true,
    );

    Get.lazyPut<PacienteApi>(
      () => PacienteApi(),
      fenix: true,
    );

    Get.lazyPut<PersonaApi>(
      () => PersonaApi(),
      fenix: true,
    );

    Get.lazyPut<HandleFirebaseAPI>(
      () => HandleFirebaseAPI(),
      fenix: true,
    );
    Get.lazyPut<LocalAuth>(
      () => LocalAuth(),
      fenix: true,
    );

    Get.lazyPut<ThemeController>(
      () => ThemeController(),
      fenix: true,
    );

    ///repositories----------------------------------------------------------------------------
    Get.lazyPut<IConnectivityRepository>(
      () => ConnectivityRepository(),
      fenix: true,
    );
    Get.lazyPut<IAuthenticationRepository>(
      () => AuthenticationRepository(),
      fenix: true,
    );
    Get.lazyPut<LocalAuthRepository>(
      () => LocalAuthRepository(),
      fenix: true,
    );

    Get.lazyPut<IDoctorRepository>(
      () => DoctorRepository(),
      fenix: true,
    );

    Get.lazyPut<ICitaRepository>(
      () => CitaRepository(),
      fenix: true,
    );
    Get.lazyPut<IPacienteRepository>(
      () => PacienteRepository(),
      fenix: true,
    );
    Get.lazyPut<IContenedorRepository>(
      () => ContenedorRepository(),
      fenix: true,
    );

    Get.lazyPut<IPersonaRepository>(
      () => PersonaRepository(),
      fenix: true,
    );

    Get.lazyPut<IHandleFirebaseRepository>(
      () => HandleFirebaseRepository(),
      fenix: true,
    );

    Get.lazyPut<ConsultaSunatController>(
      () => ConsultaSunatController(),
      fenix: true,
    );
  }
}
