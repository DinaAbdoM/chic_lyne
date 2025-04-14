import 'package:chic_lyne/core/widgets/custom_page_transition.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static void push(BuildContext context, Widget page,
      {AxisDirection direction = AxisDirection.left}) {
    Navigator.of(context).push(
      CustomPageTransition(child: page, direction: direction),
    );
  }

  static void pushReplacement(BuildContext context, Widget page,
      {AxisDirection direction = AxisDirection.left}) {
    Navigator.of(context).pushReplacement(
      CustomPageTransition(child: page, direction: direction),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}