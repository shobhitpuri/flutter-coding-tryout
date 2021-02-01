import 'package:flutter/material.dart';
import '../../common/ui/text_styles.dart';

/// Sub widget for showing current description of weather using words and image.

class WeatherDescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cloud_off_rounded,
              color: Colors.grey,
              size: 80.0,
            ),
          ],
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 15),
          child: Text(
            "Description: -",
            textAlign: TextAlign.center,
            style: SmallNormalTextStyle(),
          ),
        )),
      ],
    );
  }
}
