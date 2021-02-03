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
    _getCurrentLocation();
  }

  // TODO:
  /// Starts fetching weather
  _getCurrentLocation() async {
    context.read<LocationBloc>().add(LocationFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Weather')),

        // We use the BlocListener widget in order to "do things" in response to
        // state changes in our WeatherBloc.
        body: BlocListener<WeatherBloc, WeatherState>(
          listener: (context, state) {
            // Show a SnackBar in case of error.
            if (state is WeatherErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black54,
                  content: Text(state?.error,
                      textAlign: TextAlign.center, style: SnackBarTextStyle()),
                ),
              );
            }
          },

          // We use the BlocBuilder widget in order to "render" widgets in
          // response to state changes in our WeatherBloc.
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              // Based on the state, show the widget.
              if (state is WeatherErrorState) {
                return WeatherWidget(weatherInfo: null);
              }
              if (state is WeatherLoadedState) {
                return BackgroundWeatherThemeWidget(
                    child: WeatherWidget(weatherInfo: state?.weatherInfo),
                    backgroundImagePathForWeatherCondition: state
                        ?.weatherInfo?.backgroundImagePathForWeatherCondition);
              }
              return WeatherLoadingWidget();
            },
          ),
        ));
  }
}
