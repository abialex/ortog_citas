import '../../data/models/contenedor_model.dart';
import '../../data/models/system_notification.dart';
import '../either/either.dart';

abstract class IContenedorRepository {
  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoDocumento();
  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoGenero();
  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoOcupacion();
}
