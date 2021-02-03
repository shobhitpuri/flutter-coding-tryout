import 'package:flutter/material.dart';

/// Widget that takes care of setting background. We use webP images for performance.
class BackgroundWeatherThemeWidget extends StatelessWidget {
  final Widget child;

  // local asset location path like 'asset/image.webp"
  final String backgroundImagePathForWeatherCondition;
  final String _defaultBackgroundAssetPath = "assets/background/default.webp";

  const BackgroundWeatherThemeWidget({
    Key key,
    @required this.child,
    this.backgroundImagePathForWeatherCondition,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImagePathForWeatherCondition ??
                    _defaultBackgroundAssetPath),
                fit: BoxFit.cover)),
        child: child);
  }
}
