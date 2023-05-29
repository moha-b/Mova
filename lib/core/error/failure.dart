import 'package:dio/dio.dart';

abstract class Failure {
  String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure("Connection Timeout with the Server");
      case DioErrorType.sendTimeout:
        return ServerFailure("Sending Timeout with the Server");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Receiving Timeout with the Server");
      case DioErrorType.badResponse:
        return ServerFailure("Server Issue");
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
