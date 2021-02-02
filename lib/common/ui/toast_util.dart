import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// [ToastUtil] is a util class to enable showing variety of Toasts
class ToastUtil {
  static const _shortDurationToastTimerSeconds = 2;

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: _shortDurationToastTimerSeconds,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
