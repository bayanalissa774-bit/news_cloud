// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:news_cloud/models/news_model.dart';

class NewsService {
  static const String apiKey = "pub_0036a433ae1e4f30a406c754dd7b3874";
  static const String baseUrl = 'https://newsdata.io/api/1/latest';

  Future<List<NewsModel>> fetchNews({
    String category = 'top',
  }) async {
    final url = Uri.parse(
      '$baseUrl?apikey=$apiKey&language=en&category=$category',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final List results = data['results'] ?? [];

      return results.map((item) {
        return NewsModel.fromJson(
          item as Map<String, dynamic>,
        );
      }).toList();
    }

    throw Exception(
      'Failed to load news: ${response.statusCode}',
    );
  }
}
// أنشأنا كلاس اسمه NewsService.

// وظيفته لاحقًا ستكون:

// إرسال طلب إلى NewsData.io.
// استقبال الأخبار.
// تحويلها إلى NewsModel.
// إرسال القائمة إلى الواجهة.
