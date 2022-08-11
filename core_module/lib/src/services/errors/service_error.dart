import 'package:core_module/src/errors/application_error.dart';

class ServiceError extends ApplicationError {
  ServiceError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
