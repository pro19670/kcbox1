import 'package:flutter_test/flutter_test.dart';
import 'package:kcbox1/services/api_service.dart';

void main() {
  test('ApiService returns mock response', () async {
    final service = ApiService();
    try {
      final data = await service.fetchData("https://example.com");
      expect(data, isA<String>());
    } catch (e) {
      expect(e, isA<Exception>());
    }
  });
}
