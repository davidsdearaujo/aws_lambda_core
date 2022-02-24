import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

import 'handler_interface.dart';

abstract class ApiHandler implements HandlerInterface<AwsApiGatewayEvent, AwsApiGatewayResponse> {}
