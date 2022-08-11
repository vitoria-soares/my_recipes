class ApplicationError implements Exception {
  final String message;
  final StackTrace stackTrace;
  ApplicationError({
    required this.message,
    required this.stackTrace,
  });
}
