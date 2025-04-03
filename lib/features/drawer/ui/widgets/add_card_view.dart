import 'package:chic_lyne/features/home/ui/widgets/app_header.dart';
import 'package:flutter/material.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppHeader(title: const Text('Add Card')),
            _buildTextField(labelText: 'Card Number', keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(labelText: 'CCV', keyboardType: TextInputType.number),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(labelText: 'Exp', keyboardType: TextInputType.datetime),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField(labelText: 'Cardholder Name'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
               
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String labelText, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}