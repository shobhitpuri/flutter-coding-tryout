import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../location/bloc/events/location_event.dart';
import '../../../location/bloc/location_bloc.dart';
import '../../../common/ui/text_styles.dart';
import '../../ui/widgets/background_widget.dart';
import '../../bloc/states/weather_states.dart';
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
    print("WeatherHomeScreenState: initState");
    _refreshLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          backgroundColor: Colors.blue,
        ),

        // We use the BlocListener widget in order to "do things" in response to
        // state changes in our WeatherBloc.
        body: BlocListener<WeatherBloc, WeatherState>(
          listener: (context, state) {
            _handleWeatherBlockListener(context, state);
          },

          // We use the BlocBuilder widget in order to "render" widgets in
          // response to state changes in our WeatherBloc.
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              // Based on the state, show the widget.
              // Error state
              return RefreshIndicator(
                  onRefresh: () async {
                    _refreshLocationWeather();
                  },
                  child: _getWidgetBasedOnState(state));
            },
          ),
        ));
  }

  /// Listener to Weather Bloc states.
  /// This is to "do things" in response to state changes in WeatherBloc.
  void _handleWeatherBlockListener(BuildContext context, WeatherState state) {
    // Show a SnackBar in case of error.
    if (state is WeatherErrorState) {
      print("HomeScreen: _handleWeatherBlockListener: ${state.runtimeType}");
      // Show error in snackbar.
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black54,
          content: Text(state?.error,
              textAlign: TextAlign.center, style: SnackBarTextStyle()),
        ),
      );
    }
  }

  /// Returns the appropriate widget, given a [state].
  Widget _getWidgetBasedOnState(WeatherState state) {
    // Return weather widget for error but with no information.
    print("HomeScreen: _getWidgetBasedOnState: ${state.runtimeType}");
    if (state is WeatherErrorState) {
      return BackgroundWeatherThemeWidget(
          child: WeatherWidget(weatherInfo: null),
          backgroundImagePathForWeatherCondition: null);
    }

    // Return weather widget for load success with background and information.
    if (state is WeatherLoadedState) {
      return BackgroundWeatherThemeWidget(
          child: WeatherWidget(weatherInfo: state?.weatherInfo),
          backgroundImagePathForWeatherCondition:
              state?.weatherInfo?.backgroundImagePathForWeatherCondition);
    }

    // Default return loading, if not init or loading state.
    return WeatherLoadingWidget();
  }

  /// Refresh fetching weather by calling location refresh  in location bloc.
  /// The weather bloc responds to the location state, and fetches weather subsequently.
  _refreshLocationWeather() async {
    print("HomeScreen: _refreshLocationWeather");
    context.read<LocationBloc>().add(LocationRefreshEvent());
  }
}
