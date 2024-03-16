import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/datasource/get_city_id_datasource.dart';
import 'package:weather_app/app/domain/domain.dart';

import 'package:weather_app/core/services/i_http_service.dart';

class ServiceMock extends Mock implements IHttpService {}

class Param extends Fake implements GetParam {}

main() {
  late GetCityIdDatasource datasource;
  late IHttpService httpServiceMock;
  late GetCityParam getCityParam;

  setUp(() {
    httpServiceMock = ServiceMock();
    datasource = GetCityIdDatasource(httpService: httpServiceMock);
    getCityParam = GetCityParam(lat: 0, lng: 0);
  });

  setUpAll(() {
    registerFallbackValue(Param());
  });

  test('Should return a Map<String, dynamic>', () async {
    when(() => httpServiceMock.getValue(any()))
        .thenAnswer((_) async => cityMock);
    final result = await datasource.getCityId(getCityParam);
    expect(result, isA<Map<String, dynamic>>());
  });

  test('Should return a Exception', () async {
    when(() => httpServiceMock.getValue(any()))
        .thenAnswer((_) async => throw Exception());
    final result = datasource.getCityId(getCityParam);
    expect(result, throwsA(isA<Exception>()));
  });
}

final cityMock = {
  'id': 1,
  'name': 'São Paulo',
  'state': 'SP',
  'country': 'BR',
};
