import "package:dio/dio.dart";
import 'package:poke_dex/app/error/exception.dart';


enum RequestType { get }
const successCodes = [200, 201];

class HttpManager {
  final Dio dio;

  HttpManager({required this.dio}) {
    dio
      ..options.connectTimeout = 15000
      ..options.receiveTimeout = 15000;
  }

  Future<dynamic> get(String endpoint) async => _futureNetworkRequest(endpoint);

  Future<dynamic> _futureNetworkRequest(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleDioError(e);
    }
  }

  dynamic _handleResponse(Response response) {
    if (successCodes.contains(response.statusCode)) {
      return response.data;
    } else {
      throw serverErrorResponseMapper(response);
    }
  }

  PokedexException _handleDioError(DioError e) {
    if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout) {
      return TimeoutServerException();
    } else if (e.error is FormatException) {
      return InvalidArgOrDataException();
    } else if (e.response != null) {
      return serverErrorResponseMapper(e.response!);
    } else {
      return UnexpectedServerException();
    }
  }
}

ServerException serverErrorResponseMapper(Response response) {
  final data = response.data;
  if (data is Map) {
    if (data['message'] != null) {
      return PokedexServerException(data['message']);
    } else if (data['error'] != null) {
      return PokedexServerException(data['error']);
    }
  }
  return UnexpectedServerException();
}
