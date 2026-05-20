import 'package:core_module/src/services/http/errors/service_error.dart';
import 'package:dio/dio.dart';

import '../http_service_interface.dart';
import '../service_information.dart';

class DioHttpServiceAdapter implements HttpServiceInterface {
  final dio = Dio(BaseOptions(
    baseUrl: const String.fromEnvironment('BASE_URL'),
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  @override
  Future<ServiceInformation> request<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T? data,
    String method = 'GET',
  }) async {
    try {
      final response = await dio.request<T>(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
        data: data,
      );
      if (response.statusCode != 200) {
        throw HttpServiceError(
          statusCode: response.statusCode?.toString() ?? 'Unknown status code',
          message: 'Request failed with status code ${response.statusCode}',
          stackTrace: StackTrace.current,
        );
      }
      return ServiceInformation(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioException catch (error, stackTrace) {
      throw HttpServiceError(
        statusCode: error.response?.statusCode.toString() ?? 'Unknown status code',
        message: error.message ?? 'Unknown Dio error',
        stackTrace: stackTrace,
      );
    }
  }
}
