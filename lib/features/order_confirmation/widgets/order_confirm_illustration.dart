import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderConfirmationIllustration extends StatelessWidget {
  const OrderConfirmationIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/confirm_view.png',
      height: 1000.h,
      width: double.infinity,
    );
  }
}
