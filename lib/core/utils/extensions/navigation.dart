import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


// extension NavigationHelper on BuildContext {
//   push(Widget page) {
//     return Navigator.of(this).push(
//       FadePageRoute(builder: (context) => page),
//     );
//   }

//   pushWithNamed(String pageRoute, {Object? arguments}) {
//     return Navigator.of(this).pushNamed(
//       pageRoute,
//       arguments: arguments,
//     );
//   }

//   pushReplacement(Widget page) {
//     Navigator.of(this).pushReplacement(
//       FadePageRoute(builder: (context) => page),
//     );
//   }

//   pushReplacementWithNamed(String pageRoute, {Object? arguments}) {
//     Navigator.of(this).pushReplacementNamed(
//       pageRoute,
//       arguments: arguments,
//     );
//   }

//   pushAndRemoveUntil(Widget page) {
//     Navigator.of(this).pushAndRemoveUntil(
//       FadePageRoute(builder: (context) => page),
//       (route) => false,
//     );
//   }

//   pushAndRemoveUntilWithNamed(String pageRoute, {Object? arguments}) {
//     Navigator.of(this).pushNamedAndRemoveUntil(
//       pageRoute,
//       (route) => false,
//       arguments: arguments,
//     );
//   }

//   pop() {
//     Navigator.of(this).pop();
//   }
  
// }

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
