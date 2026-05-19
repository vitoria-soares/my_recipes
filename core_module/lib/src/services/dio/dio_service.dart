import 'package:dio/dio.dart';

import '../errors/service_error.dart';
import 'dio_service_interface.dart';
import 'service_information.dart';

class DioService implements DioServiceInterface {
  final dio = Dio();

  @override
  Future<ServiceInformation> get(String url) async {
    try {
      final response = await dio.get<dynamic>(url);
      return ServiceInformation(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioException catch (error, stackTrace) {
      throw ServiceError(
        message: error.message ?? 'Unknown Dio error',
        stackTrace: stackTrace,
      );
    }
  }
}
