import 'package:core_module/src/services/dio/service_information.dart';

abstract class DioServiceAbstraction {
  Future<ServiceInformation> get(String url);
}
