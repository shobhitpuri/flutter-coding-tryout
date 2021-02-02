import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/common/ui/toast_util.dart';

import '../../bloc/events/events.dart';
import '../../bloc/states/states.dart';
import '../../bloc/weather_bloc.dart';
import '../../ui/widgets/weather_loading_widget.dart';
import '../../ui/widgets/weather_widget.dart';

/// This widget is the home page of the application. It is stateful, meaning
/// that it has a State object (defined below) that contains fields that affect
/// how it looks.

class WeatherHomeScreen extends StatefulWidget {
  @override
  _WeatherHomeScreenState createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  @override
  void initState() {
    super.initState();
    _startWeatherFetch();
  }

  /// Starts fetching weather
  _startWeatherFetch() async {
    context.read<WeatherBloc>().add(WeatherEvents.fetchWeather);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),

      // BlocBuilder listen to the changes from the bloc file and updates the UI
      body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
        // Based on the state, show the widget.
        if (state is WeatherStateError) {
          ToastUtil.showToast("Please try again later. ${state?.error}");
          return WeatherWidget(weatherInfo: null);
        }
        if (state is WeatherStateLoaded) {
          return WeatherWidget(weatherInfo: state.weatherInfo);
        }
        return WeatherLoadingWidget();
      }),
    );
  }
}
