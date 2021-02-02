/// Enum that makes the weather condition readable.
enum WeatherCondition {
  Thunderstorm,
  Drizzle,
  Rain,
  Snow,
  Atmosphere,
  Clear,
  Clouds,
  None
}

extension WeatherConditionCodeExtension on WeatherCondition {
  int get getId {
    switch (this) {
      case WeatherCondition.Thunderstorm:
        return 2; // 2xx
      case WeatherCondition.Drizzle:
        return 3; // 3xx
      case WeatherCondition.Rain:
        return 5; // 5xx
      case WeatherCondition.Snow:
        return 6; // 6xx
      case WeatherCondition.Atmosphere:
        return 7; // 7xx
      case WeatherCondition.Clear:
        return 800; // 800
      case WeatherCondition.Clouds:
        return 8; // 8xx
      case WeatherCondition.None:
        return -1;
    }
  }
}
