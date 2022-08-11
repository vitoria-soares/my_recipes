import 'package:core_module/src/services/dio/service_information.dart';
import 'package:core_module/src/services/errors/service_error.dart';
import 'package:dependencies_module/dependencies_module.dart';

import 'dio_service_interface.dart';

class DioService implements DioServiceInterface {
  final dio = Dio();

  @override
  Future<ServiceInformation> get(String url) async {
    try {
      Response response = await dio.get(url);
      return ServiceInformation(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioError catch (error, stackTrace) {
      throw ServiceError(
        message: error.message,
        stackTrace: stackTrace,
      );
    }
  }
}
