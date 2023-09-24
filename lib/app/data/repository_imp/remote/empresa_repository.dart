// import 'package:get/get.dart';

// import '../../../domain/repository/iempresa_repository.dart';
// import '../../models/empresa/empresa_model.dart';
// import '../../provider/api/remote/empresa_api.dart';
// import '../../provider/api/remote/simulador_api.dart';

// class EmpresaRepository extends IEmpresaRepository {
//   final EmpresaAPI _api =
//       Get.find<EmpresaAPI>(); //el api ya está en la inyección
//   final SimuladorAPI _apiSimulador = Get.find<SimuladorAPI>();
//   @override
//   Future<List<EmpresaModel>> getAllEmpresas() async {
//     await Future.delayed(const Duration(seconds: 1));
//     // return _api.getAllEmpresas();
//     return _api.getAllEmpresasMock();
//   }

//   // @override
//   // Future<List<String>> getAllEstadoCivil() async {
//   //   await Future.delayed(const Duration(seconds: 1));
//   //   return _apiSimulador.getAllEstadoCivil();
//   // }
// }
