import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_apps/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';  

class ApiServiceMovie {
  static final String _url = dotenv.env['API_MOVIE_URL'] ?? 'URL tidak ditemukan';
  static final String _apiKey = dotenv.env['API_MOVIE_KEY'] ?? 'API KEY tidak ditemukan';
  static final String _imageBaseUrl = dotenv.env['API_MOVIE_BASEURL' ] ?? 'IMAGE tidak ditemukan';

  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse(
        '$_url/movie/now_playing?api_key=$_apiKey&language=en-US&page=1',
      ),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      MovieResponse movieResponse = MovieResponse.fromJson(jsonResponse);
      return movieResponse.results;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  String getImageUrl(String? path) {
    if (path == null) {
      return 'https://via.placeholder.com/500x750.png?text=No+Image';
    }
    return '$_imageBaseUrl$path';
  }
}
