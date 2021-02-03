import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../location/bloc/states/location_states.dart';
import '../../location/bloc/location_bloc.dart';
import '../models/weather_info_open_weather_api.dart';
import '../resources/weather_repository.dart';
import 'events/weather_events.dart';
import 'states/weather_states.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  // WeatherBloc has dependency on LocationBloc Blocs to react to its state changes.
  final LocationBloc locationBloc;

  // Repo
  final WeatherRepository weatherRepository;

  // The subscription provides ability to listen to the LocationBloc events.
  StreamSubscription _locationBlocSubscription;

  // Store weather information model
  OpenWeatherInfo _weatherInfo;

  WeatherBloc({this.locationBloc, this.weatherRepository})
      : super(WeatherInitState()) {
    // React to state changes from location here.
    // Add WeatherEvents in response to state changes in LocationBloc
    _locationBlocSubscription = locationBloc.listen((state) {
      // If location fetch successful, are ready, weather fetch can be initiated.
      if (state is LocationLoadedState) {
        print("WeatherBloc: LocationBloc: Listener: LocationLoadedState");
        add(WeatherFetchEvent(
            lat: state?.position?.latitude, lon: state?.position?.longitude));
      }

      // If location wasn't received, start process of showing error.
      if (state is LocationErrorState) {
        print("WeatherBloc: LocationBloc: Listener: LocationErrorState");
        add(WeatherErrorEvent(error: state?.error));
      }
    });
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvents event) async* {
    if (event is WeatherFetchEvent || event is WeatherRefreshEvent) {
      yield* _mapWeatherFetchEventToState(event);
    }

    // Handle weather error event
    else if (event is WeatherErrorEvent) {
      print("WeatherBloc: Yield WeatherErrorState");
      yield WeatherErrorState(error: event?.error);
    }
  }

  /// Process WeatherFetchEvent
  Stream<WeatherState> _mapWeatherFetchEventToState(
      WeatherFetchEvent event) async* {
    // Started fetching
    yield WeatherLoadingState();

    // Fetch
    _weatherInfo = await weatherRepository.getWeather(event?.lat, event?.lon);

    // If weather information was returned successfully
    if (_weatherInfo != null) {
      print("WeatherBloc: Yield WeatherLoadedState");
      yield WeatherLoadedState(weatherInfo: _weatherInfo);
    }

    // If error in receiving weather information due to any reason
    else {
      // Note: This is generic and can be improved if the new the library actually
      // throwed back exceptions. It right now catches them, and prints.
      // I've opened an issue on their GitHUb:
      // https://github.com/cph-cachet/flutter-plugins/issues/280
      print("WeatherBloc: Yield WeatherErrorState Network");
      yield WeatherErrorState(
          error:
              "Opps! Something is not right. Please check your connectivity and try again.");
    }
  }

  @override
  Future<void> close() {
    // StreamSubscription is closed to avoid memory leaks.
    print("WeatherBloc: _locationBlocSubscription");
    _locationBlocSubscription.cancel();
    return super.close();
  }
}
