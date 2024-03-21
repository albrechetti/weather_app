import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'custom_logger.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    AppLogger.important.i('Request: ${options.uri}');
   
    final token = dotenv.env['APIKEY'];

    options.headers.addAll({
      'Content-Type': 'application/json',
    });

    options.validateStatus = (status) {
      return status! < 500;
    };
    handler.next(options);
    options.queryParameters.addAll({
      'token': token,
    });

    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.important.e(
        'Error: ${err.requestOptions.uri} - ${err.message} - ${err.response?.statusCode} - ${err.response?.data} - ${err.response?.statusMessage} - ${err.response?.headers}');
    return;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.important.i('Response: ${response.requestOptions.uri}');
    handler.next(response);
    return;
  }
}
