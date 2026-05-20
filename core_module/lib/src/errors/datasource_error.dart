import 'package:core_module/core_module.dart';

class DatasourceError extends ApplicationError {
  DatasourceError({
    required super.message,
    required super.stackTrace,
  });
}
