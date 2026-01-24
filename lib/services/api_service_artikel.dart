import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_apps/models/newsmodel.dart';

class ApiServiceArtikel {
  static String _apiKey = '8fcba67537424ea78e2c2d5c89a14c49';
  static String _url = 'https://newsapi.org/v2';

  Future<List<Artikel>> fetchMovieNews() async {
    final Uri uri = Uri.parse('$_url/everything');
    final Map<String, String> parameters = {
      'q': 'movie',
      'apiKey': _apiKey,
      'sortBy': 'publishedAt',
      'language': 'en',
      'pageSize': '20',
    };

    final response = await http.get(uri.replace(queryParameters: parameters));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson.map((json) => Artikel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news articles: ${response.body}');
    }
  }
}
