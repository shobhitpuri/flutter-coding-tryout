import 'package:equatable/equatable.dart';
import '../../models/weather_info_open_weather_api.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final OpenWeatherInfo weatherInfo;

  WeatherLoadedState({this.weatherInfo});
}

class WeatherErrorState extends WeatherState {
  final dynamic error;

  WeatherErrorState({this.error});
}
