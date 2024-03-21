import 'package:weather_app/core/core.dart';

import '../domain/domain.dart';
import '../infra/infra.dart';

class GetCityIdDatasource implements IGetCityIdDatasource {
  final IHttpService _httpService;

  GetCityIdDatasource({required IHttpService httpService})
      : _httpService = httpService;

  @override
  Future<Map<String, dynamic>> getCityId(GetCityParam param) async {
    try {
      final getParam = GetParam(url: ApiPaths.city, params: {
        'latitude': param.lat,
        'longitude': param.lng,
      });
      final response = await _httpService.getCityId(getParam);
      return response;
    } on Exception {
      throw Exception();
    }
  }
}
