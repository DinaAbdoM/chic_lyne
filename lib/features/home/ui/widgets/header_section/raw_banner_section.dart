import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/drawer/ui/app_drawer.dart';
import 'package:chic_lyne/features/drawer/ui/widgets/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RawBannerSection extends StatefulWidget {
  const RawBannerSection({super.key});

  @override
  State<RawBannerSection> createState() => _RawBannerSectionState();
}

class _RawBannerSectionState extends State<RawBannerSection> {
  User user = User(
    name: 'John Doe',
    email: 'WtZ4o@example.com',
    phone: '1234567890',
    profileImageUrl: 'assets/man/samuel-lopes-SyPk4FxjTXQ-unsplash.jpg',
  );

  void _onProfileUpdated(User updatedUser) {
    setState(() {
      user = updatedUser;
    });
  }

  String? selectedValue;
  List<String> items = ['Men', 'Women', 'Kids'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProfileImage(context),
        _buildCategoryDropdown(),
        _buildShoppingCartButton(),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => AppDrawer(
                  user: user,
                  onEditPressed: () {},
                  onSignOutPressed: () {},
                  onProfileUpdated: _onProfileUpdated,
                ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: Image.asset(
          'assets/man/samuel-lopes-SyPk4FxjTXQ-unsplash.jpg',
          width: 50.w,
          height: 50.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButton<String>(
      style: TextStyles.font12BlackBold,
      dropdownColor: Colors.grey[200],
      icon: const Icon(Icons.keyboard_arrow_down),
      value: selectedValue,
      hint: const Text('Choose Category'),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items:
          items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
    );
  }

  Widget _buildShoppingCartButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {},
      ),
    );
  }
}
