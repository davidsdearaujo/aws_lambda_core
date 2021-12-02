import '../clean_architecture/failure.dart';

class InvalidParameterFailure extends Failure {
  InvalidParameterFailure(String parameterName) : super(code: 'invalid-parameter-$parameterName', message: 'Invalid $parameterName');
}
