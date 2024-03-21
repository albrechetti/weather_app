import 'package:flutter/foundation.dart';
import 'package:weather_app/app/domain/domain.dart';

class GeolocationViewModel extends ChangeNotifier {
  final GetCityIdUsecase _getCityIdUsecase;
  final GetWeatherDataUsecase _getWeatherDataUsecase;

  GeolocationViewModel(
      {required GetCityIdUsecase getCityIdUsecase,
      required GetWeatherDataUsecase getWeatherDataUsecase})
      : _getCityIdUsecase = getCityIdUsecase,
        _getWeatherDataUsecase = getWeatherDataUsecase;

  Future<CityEntity> getCityId(GetCityParam param) async {
    final result = await _getCityIdUsecase(param);
    return result.fold((l) => throw l, (r) => r);
  }

  Future<WeatherEntity> getWeatherData(String cityId) async {
    final result = await _getWeatherDataUsecase(cityId);
    return result.fold((l) => throw l, (r) => r);
  }
}
