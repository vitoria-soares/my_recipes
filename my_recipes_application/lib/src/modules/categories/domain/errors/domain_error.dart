import 'package:core_module/core_module.dart';

class DomainError extends ApplicationError {
  DomainError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
