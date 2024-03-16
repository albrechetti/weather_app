import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/domain/domain.dart';
import 'package:weather_app/core/core.dart';

class RepositoryMock extends Mock implements IGetCityIdRepository {}

class Param extends Fake implements GetCityParam {}

main() {
  late GetCityIdUsecase usecase;
  late IGetCityIdRepository repository;

  setUp(() {
    repository = RepositoryMock();
    usecase = GetCityIdUsecase(repository: repository);
  });

  setUpAll(() {
    registerFallbackValue(Param());
  });

  test('Should return a CityEntity', () async {
    when(() => repository.getCityId(any()))
        .thenAnswer((_) async => Right(cityMock));
    final result = await usecase(Param());
    final value = result.fold((l) => null, (r) => r);
    expect(value, isA<CityEntity>());
  });

  test('Should return a Exception', () async {
    when(() => repository.getCityId(any()))
        .thenAnswer((_) async => Left(Exception()));
    final result = await usecase(Param());
    final value = result.fold((l) => l, (r) => null);
    expect(value, isA<Exception>());
  });
}

final cityMock = CityEntity(
  id: 1,
  name: 'São Paulo',
  state: 'SP',
  country: 'BR',
);
