abstract class IHttpService {
  Future<Map<String, dynamic>> getValue(GetParam param);
}

class GetParam {
  final String url;
  final Map<String, dynamic> params;

  GetParam({required this.url, required this.params});
}
