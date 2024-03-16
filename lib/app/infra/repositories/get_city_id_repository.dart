import '../../../core/core.dart';
import '../../domain/domain.dart';
import '../infra.dart';

class GetCityIdRepository implements IGetCityIdRepository {
  final IGetCityIdDatasource _datasource;

  GetCityIdRepository({required IGetCityIdDatasource datasource})
      : _datasource = datasource;
  @override
  Future<Either<Exception, CityEntity>> getCityId(GetCityParam param) async {
    try {
      final response = await _datasource.getCityId(param);
      final city = CityMapper.fromMap(response);
      return Right(city);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
