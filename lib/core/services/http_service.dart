import 'package:dio/dio.dart';
import '../core.dart';

class HttpService implements IHttpService {
  final Dio _dio;
  HttpService({required Dio dio}) : _dio = dio {
    _dio.interceptors.add(ApiInterceptor());
    _dio.options.baseUrl = ApiPaths.baseURL;
  }
  @override
  Future<Map<String, dynamic>> getCityId(GetParam param) async {
    final response = await _dio.get(
      param.url,
      queryParameters: param.params,
    );
    AppLogger.important.i('Data: ${response.data}');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getWeatherData(GetParam param) async {
    param.params.addAll({'current': ''});
    final queryParam = param.params;
    final response = await _dio.get(
      param.url,
      queryParameters: queryParam,
    );
    AppLogger.important.i('Data: ${response.data}');
    return response.data as Map<String, dynamic>;
  }
}
