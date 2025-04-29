// import 'package:chic_lyne/core/theming/colors.dart' show AppConstantsColors;
// import 'package:flutter/material.dart';

// class CustomPageTransition extends PageRouteBuilder {
//   final Widget child;
//   final AxisDirection direction;

//   CustomPageTransition({
//     required this.child,
//     this.direction = AxisDirection.left,
//   }) : super(
//     transitionDuration: AppConstantsColors.pageTransitionDuration,
//     reverseTransitionDuration: AppConstantsColors.pageTransitionDuration,
//     pageBuilder: (context, animation, secondaryAnimation) => child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       final Offset begin;
//       switch (direction) {
//         case AxisDirection.up:
//           begin = const Offset(0, 1);
//           break;
//         case AxisDirection.down:
//           begin = const Offset(0, -1);
//           break;
//         case AxisDirection.right:
//           begin = const Offset(-1, 0);
//           break;
//         case AxisDirection.left:
//         default:
//           begin = const Offset(1, 0);
//           break;
//       }
//       final Offset end = Offset.zero;
//       final tween = Tween(begin: begin, end: end);
//       final curvedAnimation = CurvedAnimation(
//         parent: animation,
//         curve: Curves.easeInOut,
//       );
//       final offsetAnimation = tween.animate(curvedAnimation);

//       return SlideTransition(
//         position: offsetAnimation,
//         child: child,
//       );
//     },
//   );
// }