import 'package:chic_lyne/features/home/ui/widgets/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ResponsiveBackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Spacer(),
              ],
            ),
            const Spacer(),
            _buildEmptyCartIllustration(),
            const SizedBox(height: 24),
            _buildEmptyCartTitle(),
            const SizedBox(height: 8),

            _buildExploreButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCartIllustration() {
    return Image.asset('assets/empty_cart.png', height: 150.h);
  }

  Widget _buildEmptyCartTitle() {
    return Text(
      'Your Cart is Empty',
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildExploreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 47.h),
          backgroundColor: Color(0xFF8A56FC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),
        child: const Text(
          'Explore Categories',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
