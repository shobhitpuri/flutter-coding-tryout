import 'package:flutter/material.dart';
import '../../common/ui/text_styles.dart';

/// Sub widget for showing temperature and humidity.

class WeatherTempHumidityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 35.0),
          child: Text(
            '- °c',
            style: BigBoldTextStyle(),
          ),
        ),
        Column(
          children: [
            Text(
              'humidity : -',
              style: SmallNormalTextStyle(),
            ),
            Text(
              'max : - °c',
              style: SmallNormalTextStyle(),
            ),
            Text(
              'min : - °c',
              style: SmallNormalTextStyle(),
            )
          ],
        )
      ],
    );
  }
}
