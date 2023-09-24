import 'package:get/get.dart';
import '../../../domain/either/either.dart';
import '../../../domain/repository/ipersona_repository.dart';
import '../../models/persona/persona_sunat_model.dart';
import '../../models/system_notification.dart';
import '../../provider/api/remote/persona_api.dart';

class PersonaRepository extends IPersonaRepository {
  final PersonaApi _api = Get.find<PersonaApi>();

  @override
  Future<Either<SystemNotification, PersonaSunatModel?>> getPersonaSunatByDni(
      String dni) {
    return _api.getPersonaSunByDni(dni);
  }
}
