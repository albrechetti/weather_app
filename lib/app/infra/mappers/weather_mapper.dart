import 'package:weather_app/app/domain/domain.dart';

class WeatherMapper {
  static WeatherEntity fromJson(Map<String, dynamic> json) {
     double handleTemperature(json) {
      if(json['data']['temperature'] is int){
        return json['temperature'].toDouble();
      }
      return json['temperature'];
     }
    return WeatherEntity(
      temperature: json['temperature'],
      windDirection: json['windDirection'],
      windVelocity: json['windVelocity'],
      humidity: json['humidity'],
      condition: json['condition'],
      pressure: json['pressure'],
      icon: json['icon'],
      sensation: json['sensation'],
      date: json['date'],

    );
  }
}

// {
//      "id": 3477,
//      "name": "São Paulo",
//      "state": "SP",
//      "country": "BR",
//      "data": [
//      {
//           "date": "2019-09",
//           "climate_temperature": {
//               "last_year": {
//                   "min": 15,
//                   "max": 26
//                },
//                "normal": {
//                   "min": 14,
//                   "max": 24
//                },
//                "forecast": {
//                   "min": 17,
//                   "max": 27
//                }
//           },
//     },
//     {
//           "date": "2019-10",
//           "climate_temperature": {
//               "last_year": {
//                   "min": 17,
//                   "max": 25
//                },
//                "normal": {
//                   "min": 15,
//                   "max": 25
//                },
//                "forecast": {
//                   "min": 17,
//                   "max": 27
//                }
//           },
//     }
//     ...
//     ]
// }