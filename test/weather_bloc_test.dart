import 'package:bloc_test/bloc_test.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather_project/location/bloc/location_bloc.dart';
import 'package:weather_project/weather/bloc/events/weather_events.dart';
import 'package:weather_project/weather/bloc/states/weather_states.dart';
import 'package:weather_project/weather/bloc/weather_bloc.dart';
import 'package:weather_project/weather/models/weather_info_open_weather_api.dart';
import 'package:weather_project/weather/resources/weather_abstract_client.dart';
import 'package:weather_project/weather/resources/weather_repository.dart';

/// Mocks WeatherRepository
class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('WeatherBloc', () {
    WeatherBloc weatherBloc;
    LocationBloc locationBloc;
    MockWeatherRepository weatherRepository;

    setUp(() {
      locationBloc = new LocationBloc();
      weatherRepository = new MockWeatherRepository();
      weatherBloc = WeatherBloc(
          locationBloc: locationBloc, weatherRepository: weatherRepository);
    });

    tearDown(() {
      locationBloc?.close();
      weatherBloc?.close();
    });

    /// Tests positive case scenario.
    blocTest(
      'emits WeatherLoadingState -> WeatherLoadedState when weatherInfo success',
      build: () => weatherBloc,
      act: (bloc) {
        when(weatherRepository.getWeather(49.248810, -122.980507)).thenAnswer(
            (_) => Future.value(OpenWeatherInfo("Burnaby", "CA", "10n",
                "heavy intensity rain", 5, 2, 7, 99, 502)));
        bloc.add(WeatherFetchEvent(lat: 49.248810, lon: -122.980507));
      },
      expect: [isA<WeatherLoadingState>(), isA<WeatherLoadedState>()],
    );

    /// Tests error scenario.
    blocTest(
      'emits WeatherErrorState when error receiving weather data',
      build: () => weatherBloc,
      act: (bloc) => bloc.add(WeatherErrorEvent(
          error:
              "Opps! Something is not right. Please check your connectivity and try again.")),
      expect: [isA<WeatherErrorState>()],
    );

    /// Tests error scenario.
    blocTest(
      'emits WeatherLoadingState, WeatherErrorState in order with no weatherInfo',
      build: () => weatherBloc,
      act: (bloc) =>
          bloc.add(WeatherFetchEvent(lat: 49.248810, lon: -122.980507)),
      expect: [isA<WeatherLoadingState>(), isA<WeatherErrorState>()],
    );
  });
}

class MockApiClient extends Mock implements WeatherAPIClient {}
