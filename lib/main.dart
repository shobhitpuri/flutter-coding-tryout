import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'location/bloc/location_bloc.dart';
import 'weather/ui/screens/weather_home_screen.dart';
import 'weather/bloc/weather_bloc.dart';
import 'weather/resources/weather_openweather_client.dart';
import 'weather/resources/weather_repository.dart';

void main() {
  final WeatherRepository weatherRepository =
      WeatherRepository(weatherApiClient: OpenWeatherMapApiClient());

  runApp(App(weatherRepository: weatherRepository));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather',
        // We have two Blocs one for location and other for weather fetch.
        // Stream of WeatherBloc consumes from Sink of LocationBloc, seen inside the bloc class.
        home: MultiBlocProvider(providers: [
          BlocProvider<LocationBloc>(
            create: (context) => LocationBloc(),
          ),
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
                weatherRepository: weatherRepository,
                locationBloc: BlocProvider.of<LocationBloc>(context)),
          ),
        ], child: WeatherHomeScreen()));
  }
}
