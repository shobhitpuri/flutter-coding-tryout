import 'package:meta/meta.dart';

import '../resources/weather_abstract_client.dart';
import '../models/weather_info_abstract.dart';

/// Weather Repository to fetch weather details.
///
/// This is for separation of concerns. The business logic would only care for
/// the data from the repository. It's up to the repository to get.
///
/// Here we can pass any API client, and we won't need to change the logic.
/// Today its Open Weather API. Tomorrow if we change source, we won't need to
/// change business logic, UI or repository. Only introduce a new client and inject.

class WeatherRepository {
  WeatherAPIClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  /// Returns WeatherInfo future, given [lat] and [lon]
  Future<WeatherInfo> getWeather(double lat, double lon) async {
    return weatherApiClient.fetchCurrentWeather(lat, lon);
  }
}
