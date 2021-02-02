import 'package:flutter/material.dart';
import '../../models/weather_info.dart';
import '../../../common/ui/text_styles.dart';
import 'weather_icon_widget.dart';

/// Sub widget for showing current description of weather using words and image.

class WeatherDescriptionWidget extends StatelessWidget {
  final WeatherInfo weatherInfo;

  WeatherDescriptionWidget({Key key, @required this.weatherInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherIconWidget(weatherIconName: weatherInfo?.weatherIcon),
        Center(
            child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 15),
          child: Text(
            weatherInfo?.weatherDescription ?? "Description: -",
            textAlign: TextAlign.center,
            style: SmallNormalTextStyle(),
          ),
        )),
      ],
    );
  }
}
