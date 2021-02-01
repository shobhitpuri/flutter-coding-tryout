import 'package:weather/weather.dart';
import '../resources/weather_abstract_client.dart';
import '../models/weather_info.dart';

/// API client to fetch weather details from Open Weather API
class OpenWeatherMapApiClient implements WeatherAPIClient {

  // TODO: Don't save API key on repository. Rather inject it as part of build process.
  final WeatherFactory _weatherFactory =
      new WeatherFactory("bf121d077ce7e4928a2bb78ed61f3b99");

  /// Returns WeatherInfo future, given [lat] and [lon]
  @override
  Future<WeatherInfo> fetchCurrentWeather(double lat, double lon) async {
    Weather weather = await _weatherFactory?.currentWeatherByLocation(lat, lon);
    WeatherInfo weatherInfo = new WeatherInfo(
        "${weather?.areaName} ${weather?.country}",
        weather?.weatherIcon,
        weather?.weatherDescription,
        weather?.temperature?.celsius,
        weather?.tempMin?.celsius,
        weather?.tempMax?.celsius,
        weather?.humidity,
        weather?.weatherConditionCode);
    return weatherInfo;
  }
}
