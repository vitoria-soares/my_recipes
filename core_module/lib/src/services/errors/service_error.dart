import 'package:core_module/src/errors/application_error.dart';

class ServiceError extends ApplicationError {
  ServiceError({
    required super.message,
    required super.stackTrace,
  });
}
