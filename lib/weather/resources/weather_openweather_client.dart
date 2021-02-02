import 'package:weather/weather.dart';
import '../models/weather_info_open_weather_api.dart';
import 'weather_abstract_client.dart';

/// API client to fetch weather details from Open Weather API

class OpenWeatherMapApiClient implements WeatherAPIClient {
  // TODO: Don't save API key on repository. Rather inject it as part of build process.
  final WeatherFactory _weatherFactory =
      new WeatherFactory("bf121d077ce7e4928a2bb78ed61f3b99");

  /// Returns WeatherInfo future, given [lat] and [lon]
  @override
  Future<OpenWeatherInfo> fetchCurrentWeather(double lat, double lon) async {
    Weather weather = await _weatherFactory?.currentWeatherByLocation(lat, lon);
    // This is due to an issue with weather library. Instead of throwing back
    // exceptions, it right now catches them, and prints.
    // This can be handled more gracefully.
    // I've opened an improvement issue on their GitHUb:
    // https://github.com/cph-cachet/flutter-plugins/issues/280
    if (weather == null) {
      return null;
    }

    // Using custom Model here, instead of one provided by library.
    // This way in future, no matter the new API, we need not change much code around.
    OpenWeatherInfo weatherInfo = new OpenWeatherInfo(
        weather?.areaName,
        weather?.country,
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
