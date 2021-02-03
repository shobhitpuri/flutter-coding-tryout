import 'package:meta/meta.dart';

abstract class WeatherEvents {}

/// Event sent when starting to fetch weather for lat, lon.
class WeatherFetchEvent extends WeatherEvents {
  final double lat;
  final double lon;

  WeatherFetchEvent({@required this.lat, @required this.lon});
}

/// Event sent when error happens when while fetching weather.
class WeatherErrorEvent extends WeatherEvents {
  final dynamic error;

  WeatherErrorEvent({this.error});
}

/// Refresh weather
class WeatherRefreshEvent extends WeatherFetchEvent {}
