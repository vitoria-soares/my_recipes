import 'package:core_module/src/services/http/service_information.dart';

abstract class HttpServiceInterface {
  const HttpServiceInterface();
  Future<ServiceInformation> request<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T? data,
    String method = 'GET',
  });
}
