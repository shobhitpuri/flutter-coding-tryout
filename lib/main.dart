import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/weather/ui/screens/weather_home_screen.dart';

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
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: WeatherHomeScreen(),
      ),
    );
  }
}