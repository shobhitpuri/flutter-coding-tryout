import 'package:flutter/material.dart';
import '../../models/weather_info_abstract.dart';
import '../sub_components/weather_location_widget.dart';
import '../sub_components/weather_description_widget.dart';
import '../sub_components/weather_temp_humidity_widget.dart';

/// Weather widget is the parent class for the widget that shows all information

class WeatherWidget extends StatelessWidget {
  final WeatherInfo weatherInfo;

  WeatherWidget({Key key, @required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // Needed for pull to refresh
        physics: const AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Center(
            // center whole container.
            child: Container(
                // Show background around whole container
                margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                decoration: new BoxDecoration(
                    border: new Border.all(width: 0.2, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    color: new Color.fromRGBO(225, 225, 225, 0.4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Location
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                      child: WeatherLocationWidget(weatherInfo: weatherInfo),
                    ),
                    // Icon and description
                    Padding(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child:
                            WeatherDescriptionWidget(weatherInfo: weatherInfo)),
                    // Temperature and humidity details.
                    Padding(
                        padding: EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 15),
                        child: WeatherTempHumidityWidget(
                          weatherInfo: weatherInfo,
                        ))
                  ],
                ))));
  }
}
