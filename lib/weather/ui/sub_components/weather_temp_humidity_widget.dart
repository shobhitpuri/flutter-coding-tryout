import 'package:flutter/material.dart';
import '../../models/weather_info_abstract.dart';
import '../../../common/ui/text_styles.dart';

/// Sub widget for showing temperature and humidity.

class WeatherTempHumidityWidget extends StatelessWidget {
  final WeatherInfo weatherInfo;

  WeatherTempHumidityWidget({Key key, @required this.weatherInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 35.0),
          child: Text(
            _getFormattedTemperature(weatherInfo?.temperatureCelsius),
            style: BigBoldTextStyle(),
          ),
        ),
        Column(
          children: [
            Text(
              'humidity : ${weatherInfo?.humidity ?? "-"} %',
              style: SmallNormalTextStyle(),
            ),
            Text(
              'max : ${_getFormattedTemperature(weatherInfo?.tempMaxCelsius)}',
              style: SmallNormalTextStyle(),
            ),
            Text(
              'min : ${_getFormattedTemperature(weatherInfo?.tempMinCelsius)}',
              style: SmallNormalTextStyle(),
            )
          ],
        )
      ],
    );
  }

  /// Returns formatted [temp] string with rounded digits.
  String _getFormattedTemperature(double temp) {
    // TODO: This could change based on settings in future of °f vs °c.
    return temp != null ? "${temp.round()} °c" : "- °c";
  }
}
