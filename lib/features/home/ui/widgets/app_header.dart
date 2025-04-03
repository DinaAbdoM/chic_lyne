import 'package:chic_lyne/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool showLeading;
  final bool showTitle;
  final bool showActions;

  const AppHeader({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.showLeading = true,
    this.showTitle = true,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            ResponsiveBackButton(onPressed: () => Navigator.pop(context)),
            if (showLeading && leading != null) leading!,
            Expanded(
              child: Center(
                child: showTitle && title != null ? title! : const SizedBox(),
              ),
            ),
            if (showActions && actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
}

// مكون فرعي لزر الرجوع
class ResponsiveBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ResponsiveBackButton({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      // استخدام ConstrainedBox
      constraints: BoxConstraints(
        // تحديد القيود
        minWidth: 40.w,
        maxWidth: 40.w,
        minHeight: 40.h,
        maxHeight: 40.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(200.r),
        ),
        child: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, size: 25.sp),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

// مكون فرعي لعنوان AppBar
class AppBarTitle extends StatelessWidget {
  final String title;
  const AppBarTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyles.font15BlackBold);
  }
}
