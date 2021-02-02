import 'package:flutter/material.dart';
import '../../models/weather_info.dart';
import '../../../common/ui/text_styles.dart';

/// Sub widget for location information like city and country.

class WeatherLocationWidget extends StatelessWidget {
  final WeatherInfo weatherInfo;

  WeatherLocationWidget({Key key, @required this.weatherInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      weatherInfo?.location ?? "Location -",
      textAlign: TextAlign.center,
      style: BigBoldTextStyle(),
    );
  }
}
