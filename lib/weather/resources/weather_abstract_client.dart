import '../models/weather_info.dart';

/// Any new API client or source will adhere to this. That way the we won't
/// have to change much code, if we decide to use a new client.

abstract class WeatherAPIClient {

  /// Returns WeatherInfo future, given [lat] and [lon]
  Future<WeatherInfo> fetchCurrentWeather(double lat, double lon);
}