class WeatherEntity {
  final double temperature;
  final String windDirection;
  final int windVelocity;
  final int humidity;
  final String condition;
  final int pressure;
  final String icon;
  final double sensation;
  final String date;

  WeatherEntity({
    required this.temperature,
    required this.windDirection,
    required this.windVelocity,
    required this.humidity,
    required this.condition,
    required this.pressure,
    required this.icon,
    required this.sensation,
    required this.date,
  });
}
