import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Sub widget for showing current description of weather using words and image.

class WeatherIconWidget extends StatelessWidget {
  final String weatherIconName;
  final String _iconPredefinedBaseUrl = "https://openweathermap.org/img/wn/";

  WeatherIconWidget({Key key, @required this.weatherIconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _imageUrl;
    if (weatherIconName != null) {
      _imageUrl = _iconPredefinedBaseUrl + weatherIconName + "@2x.png";
    }

    return _imageUrl != null
        ? CachedNetworkImage(imageUrl: _imageUrl)
        : Icon(
            Icons.cloud_off_rounded,
            color: Colors.grey,
            size: 60.0,
          );
  }
}
