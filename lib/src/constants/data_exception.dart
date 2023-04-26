import 'package:dio/dio.dart';

class DataException implements Exception {
  DataException({required this.message, this.stackTrace});

  String message = '';
  StackTrace? stackTrace;

  DataException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        message = 'errorConnectionTimeout';
        break;
      case DioErrorType.receiveTimeout:
        message = 'errorReceiveTimeout';
        break;
      case DioErrorType.sendTimeout:
        message = 'errorSendTimeout';
        break;
      case DioErrorType.badCertificate:
        message = 'errorBadCertificate';
        break;
      case DioErrorType.badResponse:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.cancel:
        message = 'errorRequestCancelled';
        break;
      case DioErrorType.connectionError:
        message = 'errorConnectionError';
        break;
      default:
        message = 'errorInternetConnection';
        break;
    }
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'errorBadRequest';
      case 404:
        return 'errorRequestNotFound';
      case 500:
        return 'errorIntenalServer';
      default:
        return 'errorSomethingWentWrong';
    }
  }

  @override
  String toString() => message;
}
