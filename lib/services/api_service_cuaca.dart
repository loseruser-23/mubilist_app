import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_cuaca.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';  

class ApiServiceCuaca {
  static final String _apiKey = dotenv.env['API_CUACA_KEY'] ?? 'your_default_api_key tidak ditemukan';
  static final String _url = dotenv.env['API_CUACA_URL'] ?? 'Url Cuaca tidak ditemukan';

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
