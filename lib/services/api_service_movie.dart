import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_apps/models/movie_model.dart';

class ApiServiceMovie {
  static String _url = 'https://api.themoviedb.org/3';
  static String _apiKey = 'b28db4d05616a193ddbb47391f310a6c';
  static String _imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

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
