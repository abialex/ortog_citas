import 'package:ortog_citas/app/data/models/cita/cita_create_model.dart';
import 'package:ortog_citas/app/data/models/cita/cita_detalle_model.dart';
import 'package:ortog_citas/app/data/models/cita/hora_model.dart';
import 'package:ortog_citas/app/data/models/request_models/cita_request_v2.dart';
import '../../data/models/cita/cita_rapida_item_model.dart';
import '../../data/models/request_models/cita_request_v1.dart';
import '../../data/models/system_notification.dart';
import '../either/either.dart';

abstract class ICitaRepository {
  Future<Either<SystemNotification, List<HoraModel>>> getCitaFilterToday(
      CitaRequestv2Model citaRequest);
  Future<Either<SystemNotification, int>> createCita(CitaCreateModel citaModel);
  Future<Either<SystemNotification, bool>> deleteCita(int idcita);
  Future<Either<SystemNotification, CitaDetalleModel>> getCitaById(int id);
  Future<Either<SystemNotification, List<CitaRapidaItemModel>>>
      getCitasRapidasFilter(CitaRequestv1Model id);
}
