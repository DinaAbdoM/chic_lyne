import 'package:chic_lyne/features/home/ui/widgets/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 0.h,
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppHeader(title: const Text('Add Address')),
              SizedBox(height: 20.h),
              _buildTextField(labelText: 'Street Address'),
              SizedBox(height: 16.h),
              _buildTextField(labelText: 'City'),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(child: _buildTextField(labelText: 'State')),
                  SizedBox(width: 16.w),
                  Expanded(child: _buildTextField(labelText: 'Zip Code')),
                ],
              ),
              const Spacer(),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String labelText}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
      ),
      onPressed: () {},
      child: const Text('Save', style: TextStyle(color: Colors.white)),
    );
  }
}
