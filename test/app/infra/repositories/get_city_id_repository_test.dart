import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/domain/domain.dart';
import 'package:weather_app/app/infra/infra.dart';

class DatasourceMock extends Mock implements IGetCityIdDatasource {}

class Param extends Fake implements GetCityParam {}

main() {
  late GetCityIdRepository repository;
  late IGetCityIdDatasource datasource;

  setUp(() {
    datasource = DatasourceMock();
    repository = GetCityIdRepository(datasource: datasource);
  });

  setUpAll(() {
    registerFallbackValue(Param());
  });

  test('Should return a CityEntity', () async {
    when(() => datasource.getCityId(any())).thenAnswer((_) async => cityMock);
    final result = await repository.getCityId(Param());
    final value = result.fold((l) => null, (r) => r);
    expect(value, isA<CityEntity>());
  });

  test('Should return a Exception', () async {
    when(() => datasource.getCityId(any()))
        .thenAnswer((_) async => throw Exception());
    final result = await repository.getCityId(Param());
    final value = result.fold((l) => l, (r) => null);
    expect(value, isA<Exception>());
  });

  test('Should return ID equal a 1', () async {
    when(() => datasource.getCityId(any())).thenAnswer((_) async => cityMock);
    final result = await repository.getCityId(Param());
    final value = result.fold((l) => null, (r) => r);
    expect(value!.id, 1);
  });
}

final cityMock = {
  'id': 1,
  'name': 'São Paulo',
  'state': 'SP',
  'country': 'BR',
};
