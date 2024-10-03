import 'package:dio/dio.dart';

abstract class Faliers {
  final String errorMsg;

  Faliers({required this.errorMsg});
}
class FirebaseErrors extends Faliers{
  FirebaseErrors({required super.errorMsg});

}
class DioErrors extends Faliers {
  DioErrors({required super.errorMsg});
  factory DioErrors.errorFromDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.badCertificate:
        return DioErrors(errorMsg: "Bad Certificate");

      case DioExceptionType.badResponse:
        return DioErrors(errorMsg: error.type.name);

      case DioExceptionType.cancel:
        return DioErrors(errorMsg: error.type.name);

      case DioExceptionType.connectionError:
        return DioErrors(errorMsg: error.type.name);

      case DioExceptionType.connectionTimeout:
        return DioErrors(errorMsg: error.type.name);

      case DioExceptionType.receiveTimeout:
        return DioErrors(errorMsg: error.type.name);

      case DioExceptionType.sendTimeout:
        return DioErrors(errorMsg: error.type.name);

      case DioExceptionType.unknown:
        return DioErrors(errorMsg: error.type.name);
      default:
        return DioErrors(errorMsg: " There is Error , Please Try Later");
    }
  }
  factory DioErrors.errorFromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return DioErrors(
            errorMsg:
                'Bad Request: The server could not understand the request.');

      case 401:
        return DioErrors(
            errorMsg:
                'Unauthorized: Access is denied due to invalid credentials.');
      case 403:
        return DioErrors(
            errorMsg:
                'Forbidden: The server understood the request, but refuses to authorize it.');

      case 404:
        return DioErrors(
            errorMsg: 'Not Found: The requested resource could not be found.');

      case 500:
        return DioErrors(
            errorMsg:
                'Internal Server Error: The server encountered an error and could not complete the request.');

      case 501:
        return DioErrors(
            errorMsg:
                'Not Implemented: The server does not support the functionality required to fulfill the request.');
      case 502:
        return DioErrors(
            errorMsg:
                'Bad Gateway: The server received an invalid response from the upstream server.');

      case 503:
        return DioErrors(
            errorMsg:
                'Service Unavailable: The server is currently unable to handle the request due to temporary overload or maintenance.');
      case 504:
        return DioErrors(
            errorMsg:
                'Gateway Timeout: The server, while acting as a gateway, did not receive a timely response from the upstream server.');
      case 505:
        return DioErrors(
            errorMsg:
                'HTTP Version Not Supported: The server does not support the HTTP protocol version used in the request.');
      default:
        return DioErrors(
            errorMsg: 'Unknown Error: An unexpected error occurred.');
    }
  }
}

