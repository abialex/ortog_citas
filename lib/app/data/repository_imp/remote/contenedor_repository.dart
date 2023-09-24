import 'package:get/get.dart';
import '../../../domain/either/either.dart';
import '../../../domain/repository/icontenedor_repository.dart';
import '../../models/contenedor_model.dart';
import '../../models/system_notification.dart';
import '../../provider/api/remote/contenedor_api.dart';

class ContenedorRepository extends IContenedorRepository {
  final ContenedorAPI _contenedorAPI = Get.find<ContenedorAPI>();

  @override
  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoGenero() async {
    return _contenedorAPI.getContenedorTipoGenero();
  }

  @override
  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoDocumento() async {
    return _contenedorAPI.getContenedorTipoDocumento();
  }

  @override
  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoOcupacion() async {
    return _contenedorAPI.getContenedorTipoOcupacion();
  }
}
