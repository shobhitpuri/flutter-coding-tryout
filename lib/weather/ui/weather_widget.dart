import 'package:flutter/material.dart';
import 'sub_components/weather_location_widget.dart';
import 'sub_components/weather_description_widget.dart';
import 'sub_components/weather_temp_humidity_widget.dart';

class WeatherWidget extends StatelessWidget {
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
                margin: EdgeInsets.only(top: 15, left: 40, right: 40),
                decoration: new BoxDecoration(
                    border: new Border.all(width: 0.2, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    color: new Color.fromRGBO(225, 225, 225, 0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: WeatherLocationWidget(),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: WeatherDescriptionWidget()),
                    Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: WeatherTempHumidityWidget())
                  ],
                ))));
  }
}
