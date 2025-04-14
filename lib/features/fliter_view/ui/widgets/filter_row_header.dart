import 'package:chic_lyne/features/home/ui/widgets/app_header.dart';
import 'package:chic_lyne/features/home/ui/widgets/header_section/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterRowHeader extends StatelessWidget {
  const FilterRowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ResponsiveBackButton(onPressed: () => Navigator.pop(context)),
        SizedBox(width: 10.w),
        SearchTextField(suffixIcon: Icons.close),
      ],
    );
  }
}
