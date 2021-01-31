import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State.

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Weather"),
            ),
            body: Center(
              child: Text("Current Weather Placeholder"),
            )));
  }
}
