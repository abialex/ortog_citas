import 'package:get/get.dart';

import '../../../core/usecases/usecase_params.dart';
import '../../../data/models/cita/cita_rapida_item_model.dart';
import '../../../data/models/system_notification.dart';
import '../../either/either.dart';
import '../../repository/icita_repository.dart';

class GetCitasRapidasUC implements UseCaseParams {
  final ICitaRepository _repository = Get.find<ICitaRepository>();

  @override
  Future<Either<SystemNotification, List<CitaRapidaItemModel>>> call(
      params) async {
    return await _repository.getCitasRapidasFilter(params);
  }
}
