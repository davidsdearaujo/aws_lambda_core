import 'package:aws_lambda_dart_runtime/runtime/context.dart';

typedef Json = Map<String, dynamic>;

abstract class HandlerInterface<TEvent, TResponse> {
  Future<TResponse> call(Context context, TEvent event);
}
