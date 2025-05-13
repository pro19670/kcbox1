import 'package:http/http.dart' as http;

class ApiService {
  Future<String> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("API 호출 실패: \$url");
    }
  }
}
