import 'package:weather_app/core/services/i_http_service.dart';

import '../domain/domain.dart';
import '../infra/infra.dart';

class GetCityIdDatasource implements IGetCityIdDatasource {
  final IHttpService _httpService;

  GetCityIdDatasource({required IHttpService httpService})
      : _httpService = httpService;

  @override
  Future<Map<String, dynamic>> getCityId(GetCityParam param) async {
    try {
      final getParam = GetParam(url: '', params: {});
      final response = await _httpService.getValue(getParam);
      return response;
    } on Exception {
      throw Exception();
    }
  }
}
