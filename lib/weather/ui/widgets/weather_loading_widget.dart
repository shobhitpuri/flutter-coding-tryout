import 'package:flutter/material.dart';

/// Simple widget showing spinner when loading weather.
class WeatherLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 100),
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
