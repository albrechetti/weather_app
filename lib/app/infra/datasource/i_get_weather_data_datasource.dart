abstract class IGetWeatherDataDatasource {
  Future<Map<String,dynamic>> getWeatherData({required String cityId});
}