import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_apps/models/newsmodel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServiceArtikel {
  static String _apiKey = dotenv.env['API_ARTIKEL_KEY'] ?? 'your_default_api_key';
  static String _url = dotenv.env['API_ARTIKEL_URL'] ?? 'url tidak ditemukan';
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
