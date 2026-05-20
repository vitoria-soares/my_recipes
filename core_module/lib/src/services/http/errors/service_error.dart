import 'package:core_module/src/errors/application_error.dart';

class HttpServiceError extends ApplicationError {
  HttpServiceError({
    required this.statusCode,
    required super.message,
    required super.stackTrace,
  });

  final String statusCode;
}
