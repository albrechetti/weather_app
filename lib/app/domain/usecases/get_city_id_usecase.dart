import '../../../core/core.dart';
import '../domain.dart';

class GetCityIdUsecase implements IFutureUseCase<GetCityParam, CityEntity> {
  final IGetCityIdRepository _repository;

  GetCityIdUsecase({required IGetCityIdRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, CityEntity>> call(GetCityParam param) async {
    return await _repository.getCityId(param);
  }
}
