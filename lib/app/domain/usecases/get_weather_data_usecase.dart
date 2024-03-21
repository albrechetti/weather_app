import 'package:weather_app/core/core.dart';

import '../domain.dart';


class GetWeatherDataUsecase implements IFutureUseCase<String, WeatherEntity> {
  final IGetWeatherDataRepository _repository;

  GetWeatherDataUsecase({required IGetWeatherDataRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, WeatherEntity>> call(String cityId) async {
    return _repository.getWeatherData(cityId: cityId);
  }
}
