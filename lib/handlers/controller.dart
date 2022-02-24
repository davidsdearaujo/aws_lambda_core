import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';

import 'api_handler.dart';

typedef ControllerAction = Future<AwsApiGatewayResponse> Function(Context context, AwsApiGatewayEvent event);

abstract class Controller implements ApiHandler {
  Future<AwsApiGatewayResponse> get(Context context, AwsApiGatewayEvent event) async => AwsApiGatewayResponse(statusCode: 404);
  Future<AwsApiGatewayResponse> post(Context context, AwsApiGatewayEvent event) async => AwsApiGatewayResponse(statusCode: 404);
  Future<AwsApiGatewayResponse> put(Context context, AwsApiGatewayEvent event) async => AwsApiGatewayResponse(statusCode: 404);
  Future<AwsApiGatewayResponse> delete(Context context, AwsApiGatewayEvent event) async => AwsApiGatewayResponse(statusCode: 404);

  @override
  Future<AwsApiGatewayResponse> call(Context context, AwsApiGatewayEvent event) async {
    try {
      final actions = <String, ControllerAction>{
        'get': get,
        'post': post,
        'put': put,
        'delete': delete,
      };

      final currentAction = actions[event.httpMethod?.toLowerCase()];
      if (currentAction == null) throw 'invalid event';
      final response = await currentAction.call(context, event);
      return response;
    } catch (ex, stack) {
      print(ex);
      print(stack);

      // return AwsApiGatewayResponse.fromJson({}, statusCode: 500);
      return AwsApiGatewayResponse.fromJson({
        'exception': ex.toString(),
        'stackTrace': stack.toString(),
      }, statusCode: 500);
    }
  }
}
