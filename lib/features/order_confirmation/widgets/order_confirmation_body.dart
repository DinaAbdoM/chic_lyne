import 'package:chic_lyne/features/order_confirmation/widgets/order_confirm_illustration.dart';
import 'package:chic_lyne/features/order_confirmation/widgets/order_confirm_subtitle.dart';
import 'package:chic_lyne/features/order_confirmation/widgets/order_success_title.dart';
import 'package:chic_lyne/features/order_confirmation/widgets/see_order_details_button.dart';
import 'package:flutter/material.dart';

class OrderConfirmationBody extends StatelessWidget {
  final String? orderId;

  const OrderConfirmationBody({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildPurpleBackground(context),

            _buildWhiteDetailsCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPurpleBackground(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFF8A56FC),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: OrderConfirmationIllustration(),
        ),
      ),
    );
  }

  Widget _buildWhiteDetailsCard(BuildContext context) {
    return Positioned(
      top: 500,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const OrderSuccessTitle(),
            const SizedBox(height: 16),
            const OrderConfirmationSubtitle(),
            const Spacer(),
            SeeOrderDetailsButton(orderId: orderId),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
