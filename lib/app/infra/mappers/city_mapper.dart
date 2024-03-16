import 'package:weather_app/app/domain/entities/city_entity.dart';

class CityMapper {
  static CityEntity fromMap(Map<String, dynamic> map) {
    return CityEntity(
      id: map['id'],
      name: map['name'],
      state: map['state'],
      country: map['country'],
    );
  }
}
