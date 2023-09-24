import '../../data/models/persona/persona_sunat_model.dart';
import '../../data/models/system_notification.dart';
import '../either/either.dart';

abstract class IPersonaRepository {
  Future<Either<SystemNotification, PersonaSunatModel?>> getPersonaSunatByDni(
      String dni);
}
