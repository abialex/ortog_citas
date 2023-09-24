import 'package:ortog_citas/app/data/models/cita/cita_detalle_model.dart';
import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/domain/repository/icita_repository.dart';
import 'package:get/get.dart';

import '../../../core/usecases/usecase_params.dart';
import '../../either/either.dart';

class GetCitaByIdUC implements UseCaseParams {
  final ICitaRepository _repository = Get.find<ICitaRepository>();

  @override
  Future<Either<SystemNotification, CitaDetalleModel>> call(params) async {
    return await _repository.getCitaById(params);
  }
}
