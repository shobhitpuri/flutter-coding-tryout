import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/weather_info_open_weather_api.dart';
import '../resources/weather_repository.dart';
import 'events/events.dart';
import 'states/states.dart';

/// The [WeatherBloc] class converts [WeatherEvents] into [WeatherStates]
/// depends on the [WeatherRepository].

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  // Repo
  final WeatherRepository weatherRepository;

  // Store weather information model
  OpenWeatherInfo weatherInfo;

  WeatherBloc({this.weatherRepository}) : super(WeatherStateInit());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvents event) async* {
    switch (event) {
      case WeatherEvents.fetchWeather:
        // Started fetching
        yield WeatherStateLoading();

        // Fetch
        weatherInfo =
            await weatherRepository.getWeather(49.248810, -122.980507);
        if (weatherInfo != null) {
          yield WeatherStateLoaded(weatherInfo: weatherInfo);
        } else {
          // P.S: This is generic and can be improved if the new the library actually
          // throwed back exceptions. It right now catches them, and prints.
          // I've opened an issue on their GitHUb: https://github.com/cph-cachet/flutter-plugins/issues/280
          yield WeatherStateError(
              error:
                  "Opps! Something is not right. Please check your connectivity and try again.");
        }
        break;
    }
  }
}
