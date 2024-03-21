import '../../../core/core.dart';
import '../domain.dart';

abstract class IGetCityIdRepository {
  Future<Either<Exception, CityEntity>> getCityId(GetCityParam param);
}
