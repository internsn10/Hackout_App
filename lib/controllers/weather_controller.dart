import 'package:get/get.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var weather = Weather(description: '', temperature: 0.0, humidity: 0, windSpeed: 0.0).obs;

  final WeatherService weatherService = WeatherService();

  @override
  void onInit() {
    fetchWeather('India');  // Default city
    super.onInit();
  }

  void fetchWeather(String city) async {
    try {
      isLoading(true);
      var weatherResult = await weatherService.fetchWeather(city);
      weather.value = weatherResult;
    } finally {
      isLoading(false);
    }
  }
}
