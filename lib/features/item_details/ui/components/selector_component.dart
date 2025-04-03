import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectorComponent extends StatelessWidget {
  final String label;
  final Widget child;
  final double textSize;
  final double? hgt;

  const SelectorComponent({
    super.key,
    required this.label,
    required this.child,
    required this.textSize, this.hgt, Color? labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hgt,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w500),
          ),
          child,
        ],
      ),
    );
  }
}