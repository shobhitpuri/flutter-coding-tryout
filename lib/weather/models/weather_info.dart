/// Enum that makes the weather condition readable.
enum WeatherCondition {
  Thunderstorm,
  Drizzle,
  Rain,
  Snow,
  Atmosphere,
  Clear,
  Clouds
}

class WeatherInfo {
  /// Location string to show on widget.
  String location;

  /// Weather icon based on the weather conditions.
  String weatherIcon;

  /// Weather description string returned.
  String weatherDescription;

  /// Current temperature in celsius.
  double temperatureCelsius;

  /// Min temperature in celsius.
  double tempMinCelsius;

  /// Max temperature in celsius.
  double tempMaxCelsius;

  /// Current humidity in percentage.
  double humidity;

  /// Weather condition code ID that defines the weather exact condition.
  int _weatherConditionCode;

  /// To get weather condition based on which icon can be decided.
  WeatherCondition weatherCondition;

  WeatherInfo(
      this.location,
      this.weatherIcon,
      this.weatherDescription,
      this.temperatureCelsius,
      this.tempMinCelsius,
      this.tempMaxCelsius,
      this.humidity,
      this._weatherConditionCode) {
    this.weatherCondition = _getWeatherCondition();
  }

  /// Assigns the weather condition enum from the code.
  _getWeatherCondition() {
    switch (_weatherConditionCode) {
      case 2:
        weatherCondition = WeatherCondition.Thunderstorm; // 2xx
        break;
      case 3:
        weatherCondition = WeatherCondition.Drizzle; // 3xx
        break;
      case 5:
        weatherCondition = WeatherCondition.Rain; // 5xx
        break;
      case 6:
        weatherCondition = WeatherCondition.Snow; // 6xx
        break;
      case 7:
        weatherCondition = WeatherCondition.Atmosphere; // 7xx
        break;
      case 800:
        weatherCondition = WeatherCondition.Clear; // 800
        break;
      case 8:
        weatherCondition = WeatherCondition.Clouds; // 8xx
        break;
    }
  }

  /// Returns currentWeather WeatherInfo
  get currentWeather => this;

  /// Returns current weather condition enum.
  get currentWeatherCondition => weatherCondition;

  @override
  String toString() {
    return 'WeatherInfo{location: $location,'
        ' weatherIcon: $weatherIcon,'
        ' weatherDescription: $weatherDescription,'
        ' temperatureCelsius: $temperatureCelsius,'
        ' tempMinCelsius: $tempMinCelsius,'
        ' tempMaxCelsius: $tempMaxCelsius,'
        ' humidity: $humidity,'
        ' _weatherConditionCode: $_weatherConditionCode}';
  }
}
