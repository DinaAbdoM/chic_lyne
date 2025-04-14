import 'package:chic_lyne/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font15BlueBold = TextStyle(
    color: Colors.blue,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font15BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20purpleBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.purple,
  );
  static TextStyle font12BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font13purpleBold = TextStyle(
    color: Colors.deepPurpleAccent,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font12greyBold = TextStyle(
    color: Colors.grey,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
 
  static TextStyle font20RedBold = TextStyle(
    color: Colors.red,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle itemTitle(double fontSize) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  static TextStyle itemPrice(double fontSize) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }
  static TextStyle font14BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font12RedBold = TextStyle(
    color: Colors.red,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
}
