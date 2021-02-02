import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/weather_info.dart';
import '../resources/weather_repository.dart';
import 'events/events.dart';
import 'states/states.dart';

/// The [WeatherBloc] class converts [WeatherEvents] into [WeatherStates]
/// depends on the [WeatherRepository].

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  // Repo
  final WeatherRepository weatherRepository;

  // Store weather information model
  WeatherInfo weatherInfo;

  WeatherBloc({this.weatherRepository}) : super(WeatherStateInit());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvents event) async* {
    switch (event) {
      case WeatherEvents.fetchWeather:
        // Started fetching
        yield WeatherStateLoading();
        try {
          // TODO: Replace these once location is fetched.
          weatherInfo =
              await weatherRepository.getWeather(49.248810, -122.980507);
          // When done fetching
          yield WeatherStateLoaded(weatherInfo: weatherInfo);
        } catch (error) {
          // Error scenario
          yield WeatherStateError(error);
        }
        break;
    }
  }
}
