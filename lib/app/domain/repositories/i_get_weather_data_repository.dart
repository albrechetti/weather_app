import 'package:weather_app/app/domain/domain.dart';
import '../../../core/core.dart';

abstract class IGetWeatherDataRepository {
  Future<Either<Exception, WeatherEntity>> getWeatherData({required String cityId});
}
