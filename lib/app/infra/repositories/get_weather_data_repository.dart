import 'package:weather_app/app/infra/datasource/i_get_weather_data_datasource.dart';
import 'package:weather_app/app/infra/mappers/weather_mapper.dart';

import '../../../core/core.dart';
import '../../domain/domain.dart';

class GetWeatherDataRepository implements IGetWeatherDataRepository {
  final IGetWeatherDataDatasource _datasource;

  GetWeatherDataRepository({required IGetWeatherDataDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<Exception, WeatherEntity>> getWeatherData(
      {required String cityId}) async {
    try {
      final response = await _datasource.getWeatherData(cityId: cityId);
      final weatherData = WeatherMapper.fromJson(response);
      return Right(weatherData);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
