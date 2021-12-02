import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';

typedef Json = Map<String, dynamic>;

abstract class HandlerInterface {
  Future<AwsApiGatewayResponse> call(Context context, AwsApiGatewayEvent event);
}
