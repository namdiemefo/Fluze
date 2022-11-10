import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../ui/navigation/navigation_manager.dart';
import '../di/dependency.dart';


class AppFunctions {

  static final AppFunctions _singleton = AppFunctions._internal();

  factory AppFunctions() {
    return _singleton;
  }

  AppFunctions._internal();

  TextStyle adaptableTextStyle({double? size, FontWeight? fontWeight, Color? color, double? lineSpacing}) {
    return TextStyle(
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: size,
        height: lineSpacing,
        color: color
    );
  }

  TextStyle adaptableTextStyleUnderLine({double? size, FontWeight? fontWeight, Color? color, double? lineSpacing}) {
    return TextStyle(
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: size,
        height: lineSpacing,
        color: color,
        decoration: TextDecoration.underline
    );
  }

  Widget verticalSpacing(double size) {
    return SizedBox(height: size);
  }

  Widget horizontalSpacing(double size) {
    return SizedBox(width: size);
  }


  void dismiss() {
    // Navigator.of(context, rootNavigator: true).pop();
    final NavigationManager navigationManager = locator.get<NavigationManager>();
    navigationManager.pop();
  }

  dynamic showErrorFlushBar(BuildContext context, String error) {
    return Flushbar(
      shouldIconPulse: false,
      messageText: Row(
        children:  [
          const Icon(Icons.error_outline_outlined, color: Colors.white),
          const SizedBox(width: 5.0),
          Expanded(
            child: Text(
              error,
              style: adaptableTextStyle(
                  size: 10.0, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 5),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
    ).show(context);
  }

  dynamic showSuccessFlushBar(BuildContext context, String message) {
    return Flushbar(
      shouldIconPulse: false,
      messageText: Row(
        children: [
          // SvgPicture.asset(smile_svg, color: bWhite),
          const SizedBox(width: 5.0),
          Expanded(
            child: Text(
              message,
              style: adaptableTextStyle(
                  size: 10.0, color: Colors.white, fontWeight: FontWeight.normal),
              // style: BloommAssets.adaptableTextStyle(
              //     size: 12, fontWeight: FontWeight.w400, color: bWhite),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 5),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
    ).show(context);
  }

  bool validateEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validateString(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validateSequence(String pin) {
    var numbers = "0123456789";
    var numbersRev = "9876543210";
    return !numbers.contains(pin) && !numbersRev.contains(pin);
  }

  bool validateRepetition(String pin) {
    final List<String> strArray = pin.split("");
    var counts = <String, int>{};
    for (var char in strArray) {
      counts[char] = (counts[char] ?? 0) + 1;
    }
    bool isGreaterThanTwo = counts.values.any((element) => element > 2);
    return !isGreaterThanTwo;
  }

}