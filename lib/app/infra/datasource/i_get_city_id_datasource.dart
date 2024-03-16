import 'package:weather_app/app/domain/params/get_city_param.dart';

abstract class IGetCityIdDatasource {
  Future<Map<String, dynamic>> getCityId(GetCityParam param);
}
