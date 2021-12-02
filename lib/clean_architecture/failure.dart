abstract class Failure {
  final String code;
  final String? message;
  final Object? exception;
  final StackTrace? stacktrace;
  const Failure({required this.code, required this.message, this.exception, this.stacktrace});

  @override
  String toString() {
    return 'Failure(code: $code, message: $message, exception: $exception, stacktrace: $stacktrace)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure &&
        other.code == code &&
        other.message == message &&
        other.exception == exception &&
        other.stacktrace == stacktrace;
  }

  @override
  int get hashCode {
    return code.hashCode ^ message.hashCode ^ exception.hashCode ^ stacktrace.hashCode;
  }
}
