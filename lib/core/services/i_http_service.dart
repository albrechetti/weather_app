abstract class IHttpService {
  Future<Map<String, dynamic>> getCityId(GetParam param);
  Future<Map<String, dynamic>> getWeatherData(GetParam param);
}

class GetParam {
  final String url;
  final Map<String, dynamic> params;

  GetParam({required this.url, required this.params});
}
