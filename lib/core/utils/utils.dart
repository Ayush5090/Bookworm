import 'package:bookworm/core/resources/pallet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showToast(String message, {Toast? length, Color? color}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: length ?? Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Pallet.secondary,
        textColor: Colors.white,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM);
  }
}
