import 'package:core_module/src/services/dio/service_information.dart';

abstract class DioServiceInterface {
  Future<ServiceInformation> get(String url);
}
