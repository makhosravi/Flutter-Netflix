import 'package:flutter/material.dart';
import 'package:flutter_movie/service_locator.dart';

class AppNavigator {
  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static void push(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static void pushAndRemove(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> rout) => false,
    );
  }

  static void pushedNamedAndRemoveUntil(String route) {
    sl<GlobalKey<NavigatorState>>().currentState?.pushNamedAndRemoveUntil(
          route,
          (r) => false,
        );
  }
}
