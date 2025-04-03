import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  // Selected payment method
  String? _selectedPaymentMethod;

  // Sample payment methods
  final List<Map<String, dynamic>> _cards = [
    {'id': 1, 'last4': '4187', 'type': 'mastercard'},
    {'id': 2, 'last4': '9387', 'type': 'mastercard'},
  ];

  final Map<String, dynamic> _paypal = {'email': 'Cloth@gmail.com'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back_ios_new, size: 16),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cards Section
            const Text(
              'Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),

            // Card List
            ..._buildCardItems(),

            const SizedBox(height: 24),

            // PayPal Section
            const Text(
              'PayPal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),

            // PayPal Option
            _buildPayPalItem(),
          ],
        ),
      ),
    );
  }

  // Build card payment options
  List<Widget> _buildCardItems() {
    return _cards.map((card) {
      return _buildPaymentOption(
        isSelected: _selectedPaymentMethod == 'card_${card['id']}',
        onTap: () {
          setState(() {
            _selectedPaymentMethod = 'card_${card['id']}';
          });
        },
        leading: _getCardIcon(card['type']),
        title: '**** ${card['last4']}',
      );
    }).toList();
  }

  // Build PayPal payment option
  Widget _buildPayPalItem() {
    return _buildPaymentOption(
      isSelected: _selectedPaymentMethod == 'paypal',
      onTap: () {
        setState(() {
          _selectedPaymentMethod = 'paypal';
        });
      },
      title: _paypal['email'],
      leading: null, // No icon for PayPal in the mockup
    );
  }

  // Generic payment option builder
  Widget _buildPaymentOption({
    required bool isSelected,
    required VoidCallback onTap,
    required String title,
    Widget? leading,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right, color: Colors.black54),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // Get card icon based on card type
  Widget? _getCardIcon(String cardType) {
    switch (cardType) {
      case 'mastercard':
        return Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: const Center(
            child: Text('🔴', style: TextStyle(fontSize: 16)),
          ),
        );
      case 'visa':
        return Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Center(
            child: Text(
              'V',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
