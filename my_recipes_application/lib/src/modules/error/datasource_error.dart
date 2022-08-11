import 'package:core_module/core_module.dart';

class DatasourceError extends ApplicationError {
  DatasourceError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
