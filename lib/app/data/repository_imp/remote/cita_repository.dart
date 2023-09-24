import 'package:ortog_citas/app/data/models/cita/cita_create_model.dart';
import 'package:ortog_citas/app/data/models/cita/cita_detalle_model.dart';
import 'package:ortog_citas/app/data/models/cita/cita_rapida_item_model.dart';
import 'package:ortog_citas/app/data/models/cita/hora_model.dart';
import 'package:ortog_citas/app/data/models/request_models/cita_request_v2.dart';
import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/data/provider/api/remote/cita_api.dart';
import 'package:get/get.dart';

import '../../../domain/either/either.dart';
import '../../../domain/repository/icita_repository.dart';
import '../../models/request_models/cita_request_v1.dart';

class CitaRepository extends ICitaRepository {
  final CitaAPI _api = Get.find<CitaAPI>();

  @override
  Future<Either<SystemNotification, List<HoraModel>>> getCitaFilterToday(
      CitaRequestv2Model citaRequest) {
    return _api.getCitaFilterToday(citaRequest);
  }

  @override
  Future<Either<SystemNotification, int>> createCita(
      CitaCreateModel citaModel) {
    return _api.createCita(citaModel);
  }

  @override
  Future<Either<SystemNotification, bool>> deleteCita(int idcita) {
    return _api.deleteCita(idcita);
  }

  @override
  Future<Either<SystemNotification, CitaDetalleModel>> getCitaById(int id) {
    return _api.getCitaById(id);
  }

  @override
  Future<Either<SystemNotification, List<CitaRapidaItemModel>>>
      getCitasRapidasFilter(CitaRequestv1Model citaRequestv2Model) {
    return _api.getCitasRapidasFilter(citaRequestv2Model);
  }
}
