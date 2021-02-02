/// Although the weather package has a class named Weather with all the API result,
/// I created the class with the limited set we need for out app.
/// Even if we swap the Open Weather API or the weather package, we'd only need
/// to populate this class object to show information we want. '

abstract class WeatherInfo {
  /// Location string to show on widget.
  String areaName;

  /// Country.
  String country;

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

  WeatherInfo(
      this.areaName,
      this.country,
      this.weatherIcon,
      this.weatherDescription,
      this.temperatureCelsius,
      this.tempMinCelsius,
      this.tempMaxCelsius,
      this.humidity);

  /// Returns currentWeather WeatherInfo
  get currentWeather => this;

  @override
  String toString() {
    return 'WeatherInfo{location: $areaName,'
        ' weatherIcon: $weatherIcon,'
        ' weatherDescription: $weatherDescription,'
        ' temperatureCelsius: $temperatureCelsius,'
        ' tempMinCelsius: $tempMinCelsius,'
        ' tempMaxCelsius: $tempMaxCelsius,'
        ' humidity: $humidity,';
  }
}
