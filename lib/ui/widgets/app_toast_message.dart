import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:space_x/const/app_values.dart';

class AppToastMessage {
  void showToastMsg(String message, ToastStates toastState) {
    Color chooseToastColor({required ToastStates state}) {
      Color color;
      switch (state) {
        case ToastStates.success:
          color = Colors.green;
          break;
        case ToastStates.warning:
          color = Colors.yellow;
          break;
        case ToastStates.error:
          color = Colors.red;
          break;
      }
      return color;
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state: toastState),
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
