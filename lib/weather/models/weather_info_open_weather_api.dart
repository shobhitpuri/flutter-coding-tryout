import '../models/weather_info_abstract.dart';
import 'weather_condition_enum.dart';

/// Contains details specific to Open Weather API.
/// Base class has common elements that'll be needed even if we change API

class OpenWeatherInfo extends WeatherInfo {
  /// Weather condition code ID that defines the weather exact condition.
  int _weatherConditionCode;

  /// To get weather condition based on which icon can be decided.
  WeatherCondition weatherCondition;

  /// Local path to the background image for the current weather condition.
  String backgroundImagePathForWeatherCondition;

  OpenWeatherInfo(
      String areaName,
      String country,
      String weatherIcon,
      String weatherDescription,
      double temperatureCelsius,
      double tempMinCelsius,
      double tempMaxCelsius,
      double humidity,
      this._weatherConditionCode)
      : super(areaName, country, weatherIcon, weatherDescription,
            temperatureCelsius, tempMinCelsius, tempMaxCelsius, humidity) {
    this.weatherCondition = _getWeatherCondition();
    this.backgroundImagePathForWeatherCondition =
        _getBackgroundImagePathForWeatherCondition(weatherCondition);
  }

  /// Assigns the weather condition enum from the code.
  WeatherCondition _getWeatherCondition() {
    if (_weatherConditionCode == null) {
      return WeatherCondition.None;
    }
    int _weatherConditionCodeInit = _weatherConditionCode ~/ 100;

    for (var value in WeatherCondition.values) {
      if (value.getId == _weatherConditionCode ||
          value.getId == _weatherConditionCodeInit) {
        return value;
      }
    }
    return WeatherCondition.None;
  }

  /// Given [__weatherCondition], it returns the image to use for background.
  String _getBackgroundImagePathForWeatherCondition(
      WeatherCondition _weatherCondition) {
    switch (_weatherCondition) {
      case WeatherCondition.Thunderstorm:
        return "assets/background/thunderstorm.webp";
      case WeatherCondition.Drizzle:
      case WeatherCondition.Rain:
        return "assets/background/rain.webp";
      case WeatherCondition.Snow:
        return "assets/background/snow.webp";
      case WeatherCondition.Atmosphere:
        return "assets/background/default.webp";
      case WeatherCondition.Clear:
        return "assets/background/clear.webp";
      case WeatherCondition.Clouds:
        return "assets/background/cloudy.webp";
      case WeatherCondition.None:
        return "assets/background/default.webp";
    }
    return "assets/background/default.webp";
  }

  /// Returns current weather condition enum.
  get currentWeatherCondition => weatherCondition;

  /// Returns background image path for current weather condition.
  String get getBackgroundImagePathForWeatherCondition =>
      backgroundImagePathForWeatherCondition;
}
