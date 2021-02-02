import 'package:equatable/equatable.dart';
import '../../models/weather_info.dart';

/// Extend the Equatable class to compare CurrentWeatherState objects.
abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherStateInit extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  final WeatherInfo weatherInfo;

  WeatherStateLoaded({this.weatherInfo});
}

class WeatherStateError extends WeatherState {
  final dynamic error;

  WeatherStateError(this.error);
}
