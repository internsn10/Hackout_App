import 'dart:convert';
import 'package:hackout/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '5f4405098a6c3af9687e965617c5ca29';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
