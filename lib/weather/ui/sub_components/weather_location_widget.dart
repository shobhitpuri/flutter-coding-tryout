import 'package:flutter/material.dart';
import '../../common/ui/text_styles.dart';

/// Sub widget for location information like city and country.

class WeatherLocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Location -",
      textAlign: TextAlign.center,
      style: BigBoldTextStyle(),
    );
  }
}
