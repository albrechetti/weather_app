import '../../core/core.dart';
import '../infra/infra.dart';

class GetWeatherDataDatasource implements IGetWeatherDataDatasource {
  final IHttpService _httpService;

  GetWeatherDataDatasource({required IHttpService httpService})
      : _httpService = httpService;

  @override
  Future<Map<String, dynamic>> getWeatherData({required String cityId}) async {
    try {
      final getParam = GetParam(url: ApiPaths.weather, params: {
        'id': cityId,
      });
      final response = await _httpService.getCityId(getParam);
      return response;
    } on Exception {
      throw Exception();
    }
  }
}
