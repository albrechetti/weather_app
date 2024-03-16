import 'package:weather_app/app/domain/entities/weather_entity.dart';

class CityEntity {
  final int id;
  final String name;
  final String state;
  final String country;
  final WeatherEntity? weatherEntity;

  CityEntity({
    required this.id,
    required this.name,
    required this.state,
    required this.country,
    this.weatherEntity,
  });
}
