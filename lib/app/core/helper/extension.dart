import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum SnackType { success, error, warning, info }

extension on SnackType {
  // ignore: unused_element
  Color get color {
    switch (this) {
      case SnackType.success:
        return Colors.green;
      case SnackType.error:
        return Colors.red;
      case SnackType.warning:
        return Colors.orange;
      case SnackType.info:
        return Colors.black;
    }
  }
}

extension DateTimeExtension on DateTime {
  String toYyyyMmDd() {
    return DateFormat("yyyy-MM-dd").format(this);
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
    double backgroundRadius = 8,
    Color textColor = Colors.white,
    SnackType snackType = SnackType.info,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(8),
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: Colors.black,
      duration: duration,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(backgroundRadius),
      ),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
