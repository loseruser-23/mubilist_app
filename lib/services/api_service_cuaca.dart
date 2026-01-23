import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_cuaca.dart';

class ApiServiceCuaca {
  static const String _apiKey = '8f1fbbee1f26bfd6432eae8adc7279b8';
  static const String _url = 'https://api.openweathermap.org/data/2.5/weather';

  Future<DataCuaca> fetchWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$_url?q=$cityName&appid=$_apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      // Jika server merespons sukses, parse JSON
      return DataCuaca.fromJson(jsonDecode(response.body));
    } else {
      // Jika ada error, lempar exception
      throw Exception('error fetching weather data');
    }
  }
}
