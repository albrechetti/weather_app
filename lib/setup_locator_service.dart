import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app/infra/infra.dart';
import 'package:weather_app/core/core.dart';

import 'app/datasource/datasource.dart';
import 'app/domain/domain.dart';
import 'app/views/geolocation/geolocation_view_model.dart';

final locator = GetIt.instance;
void setupLocator() {
  //Base services
  locator.registerFactory(() => Dio());
  locator.registerFactory<IHttpService>(() => HttpService(dio: locator()));

  // Get City ID Feature
  locator.registerFactory<IGetCityIdDatasource>(
    () => GetCityIdDatasource(httpService: locator()),
  );
  locator.registerFactory<IGetCityIdRepository>(
    () => GetCityIdRepository(datasource: locator()),
  );
  locator.registerFactory<GetCityIdUsecase>(
    () => GetCityIdUsecase(repository: locator()),
  );

  // Get Weather Feature
  locator.registerFactory<IGetWeatherDataDatasource>(
    () => GetWeatherDataDatasource(httpService: locator()),
  );
  locator.registerFactory<IGetWeatherDataRepository>(
    () => GetWeatherDataRepository(datasource: locator()),
  );
  locator.registerFactory<GetWeatherDataUsecase>(
    () => GetWeatherDataUsecase(repository: locator()),
  );
  //View model
  locator.registerSingleton<GeolocationViewModel>(
    GeolocationViewModel(
      getCityIdUsecase: locator(),
      getWeatherDataUsecase: locator(),
    ),
  );
}
