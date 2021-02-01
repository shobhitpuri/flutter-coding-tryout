import 'package:flutter/material.dart';

/// TextStyle for normal sized text
class SmallNormalTextStyle extends TextStyle {
  @override
  double get fontSize => 16;

  @override
  FontWeight get fontWeight => FontWeight.normal;

  @override
  Color get color => Colors.black;
}

/// TextStyle for big bold text
class BigBoldTextStyle extends TextStyle {
  @override
  double get fontSize => 32;

  @override
  FontWeight get fontWeight => FontWeight.w700;

  @override
  Color get color => Colors.black;
}
