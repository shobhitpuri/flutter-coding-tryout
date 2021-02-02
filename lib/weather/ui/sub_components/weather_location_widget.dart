import 'package:flutter/material.dart';
import '../../models/weather_info_abstract.dart';
import '../../../common/ui/text_styles.dart';

/// Sub widget for location information like city and country.

class WeatherLocationWidget extends StatelessWidget {
  final WeatherInfo weatherInfo;

  WeatherLocationWidget({Key key, @required this.weatherInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _getFormattedLocation() ?? "Location -",
      textAlign: TextAlign.center,
      style: BigBoldTextStyle(),
    );
  }

  /// Returns the formatted location combining country and area.
  String _getFormattedLocation() {
    StringBuffer stringBuffer = new StringBuffer();
    if (weatherInfo?.areaName != null) {
      stringBuffer.write(weatherInfo?.areaName);
    }
    if (weatherInfo?.country != null) {
      if (weatherInfo?.areaName != null) stringBuffer.write(", ");
      stringBuffer.write(weatherInfo?.country);
    }
    if (stringBuffer.toString().isNotEmpty) return stringBuffer.toString();
    return null;
  }
}
